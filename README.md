# Usage

## Clone

```shell
git clone git@github.com:harryxu/nvim.git ~/.config/nvim
```

## packer.nvim

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Prepare for neovim

```shell
# install python3 for mac
brew install python3

ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
pip3 install pynvim
```

### font
```
brew tap homebrew/cask-fonts
brew install --cask font-Iosevka-nerd-font
```

Open vim or neovim, if VimPlug not auto install, run `:PlugInstall`.


### Set GOPATH

Put flow lines to `.zshrc` or `.bashrc`.

    # GOPATH
    if hash go 2>/dev/null; then
        export PATH=$PATH:$(go env GOPATH)/bin
        export GOPATH=$(go env GOPATH)
    fi


