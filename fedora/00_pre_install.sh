#!/usr/bin/env bash

set -euo pipefail

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCESSO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[AVISO]${NC} $1"; }
log_err() { echo -e "${RED}[ERRO]${NC} $1"; }

if [ "$EUID" -ne 0 ]; then
    log_err "Execute este script como root (ex: sudo ./nobara-ify.sh)"
    exit 1
fi

log_info "Iniciando otimizações no Fedora..."

# 1. OTIMIZAÇÃO DO DNF
log_info "1. Otimizando configurações do DNF (downloads paralelos e espelhos mais rápidos)..."
DNF_CONF="/etc/dnf/dnf.conf"
if ! grep -q "max_parallel_downloads" "$DNF_CONF"; then
    echo "max_parallel_downloads=10" >> "$DNF_CONF"
fi
if ! grep -q "fastestmirror" "$DNF_CONF"; then
    echo "fastestmirror=True" >> "$DNF_CONF"
fi
if ! grep -q "defaultyes" "$DNF_CONF"; then
    echo "defaultyes=True" >> "$DNF_CONF"
fi
log_success "DNF otimizado."

# 2. HABILITAR REPOSITÓRIOS RPM FUSION E FLATHUB
log_info "2. Habilitando RPM Fusion (Free e Non-Free) e Flathub..."
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
               https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm || true
dnf config-manager --set-enabled rpmfusion-free-tainted || true
dnf config-manager --set-enabled rpmfusion-nonfree-tainted || true

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo || true
log_success "Repositórios configurados."

# 3. OTIMIZAÇÕES DE KERNEL E SYSCTL (SYSCTL.D)
log_info "3. Aplicando otimizações sysctl (vm.max_map_count, swappiness)..."
cat << 'EOF' > /etc/sysctl.d/99-nobara-gaming.conf
# Aumenta o limite de mapas de memória para jogos pesados (EAC, VR, Star Citizen)
vm.max_map_count = 16777216

# Reduz uso de Swap para priorizar RAM
vm.swappiness = 10

# Aumenta limite de arquivos abertos
fs.file-max = 2097152

# Otimização de escrita de memória virtual no disco
vm.dirty_ratio = 10
vm.dirty_background_ratio = 5
EOF

sysctl --system > /dev/null 2>&1 || true
log_success "Parâmetros do Kernel aplicados."

# 4. LIMITES DE SEGURANÇA E PROCESSOS (PAM LIMITS)
log_info "4. Configurando limites de arquivos abertos e memlock para jogos..."
cat << 'EOF' > /etc/security/limits.d/99-nobara-limits.conf
* hard nofile 1048576
* soft nofile 1048576
* hard memlock unlimited
* soft memlock unlimited
EOF
log_success "Limites do sistema atualizados."

# 5. CODECS MULTIMÍDIA E ACCELERATION DRIVERS
log_info "5. Substituindo ffmpeg-free pelo FFmpeg completo e instalando codecs..."
dnf swap -y ffmpeg-free ffmpeg --allowerasing || true
dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin || true
dnf groupupdate -y sound-and-video || true

# 6 KERNEL CUSTOMIZADO DE JOGOS (FSYNC/BORE)
log_warn "Deseja habilitar o repositório COPR para instalar um Kernel customizado para jogos (patches Fsync/BORE)?"
log_warn "Pressione 'y' em até 5 segundos para aceitar, ou qualquer outra tecla para pular..."
if read -r -t 5 -n 1 answer && [[ $answer =~ ^[Yy]$ ]]; then
    echo ""
    log_info "Adicionando COPR de Kernel Gamer..."
    dnf copr enable -y sentry/kernel-fsync || true
    dnf upgrade -y --refresh || true
else
    echo ""
    log_info "Mantendo o kernel padrão do Fedora."
fi

# 7 LIMPEZA
dnf clean all
dnf autoremove -y
journalctl --vacuum-time=7d

# REINCIAR
systemctl reboot
