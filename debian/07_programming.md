# Programming Setup

## Neovim (latest)



```bash
## install
sudo apt remove neovim -y
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
mkdir ~/.local/bin
mv nvim-linux64.tar.gz ~/.local/bin
cd ~/.local/bin
tar xzvf nvim-linux64.tar.gz
rm -fr nvim-linux64.tar.gz
ln -s ./nvim-linux64/bin/nvim ./nvim
nvim --version

## config

### packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

### python
sudo apt install  npm
sudo npm i -g pyright
```

## Python

python3 -m pip install autopep8 flake8 pyflakes isort yapf numpy pandas matplotlib ipython3 jedi pynvim

## Miniconda

1. Download do anaconda
2. <https://www.anaconda.com/products/individual>
3. wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
4. $ sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
5. $ sh Miniconda3-latest-Linux-x86_64.sh
6. fechar o terminal e abrir de novo
7. $ source ~/.bashrc

# se for o anaconda
8. $ /home/mt/anaconda3/bin/activate
9. $ conda list
10. $ anaconda-navigator
11. se nao funcionar
12. $ conda install -c anaconda anaconda-navigator
13. $ cd anaconda3/bin
14. $ ./anaconda-navigator
15. terminar
16. $ conda config --set auto_activate_base False
17. $ conda deactivate

## conda install

- python: conda install -c conda-forge python
- pytorch: conda install -c pytorch pytorch
- torchvision: conda install -c pytorch torchvision
- ipykernel: conda install -n base ipykernel --update-deps --force-reinstall
- jupyterlab: conda install -c conda-forge jupyterlab
- r: conda install -c conda-forge r-base
- rstudio: conda install -c r rstudio

