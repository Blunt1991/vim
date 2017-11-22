# vimrc


- clone repo

```bash
cd ~/ && git clone https://github.com/amsuny/vim.git
mv  ~/vim ~/.vim
```  

- install vim-plug 

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- link vimrc

```bash
ln -s .vim/vimrc ~/.vimrc
```

- flake8

```bash
ln -s .vim/flake8 ~/.config/flake8
```
- install plugins

open vim and `:PlugInstall`

