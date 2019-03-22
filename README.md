# Vim setup
Installing this vim setup:
```bash
$ git clone https://gitlab.com/job008/nvim.git ~/.vim/
```

## installing Neovim
Install Neovim using the [installation guide](https://github.com/neovim/neovim/wiki/Installing-Neovim)

Then setup the init to listen to the regular vim configurations in '$HOME/config/nvim/init.vim'
```bash
$ mkdir -p $HOME/.config/nvim && \
  echo -e "set runtimepath^=\$HOME/.vim runtimepath+=\$HOME/.vim/after\nlet &packpath = &runtimepath\nsource \$HOME/.vim/vimrc" > $HOME/.config/nvim/init.vim
```
