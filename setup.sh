#!/bin/bash
# this should be run from the current location $HOME/dotfiles

# bash settings
#ln -s bashrc $HOME/.bashrc
#ln -s profile $HOME/.profile
DOTFILES=$HOME/dotfiles
ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES/gitignore $HOME/.gitignore
ln -s $DOTFILES/irbrc $HOME/.irbrc
ln -s $DOTFILES/ipythonrc $HOME/.ipythonrc
ln -s $DOTFILES/pylintrc $HOME/.pylintrc

# vim setup
ln -s $DOTFILES/vim $HOME/.vim
ln -s $DOTFILES/vimrc $HOME/.vimrc
ln -s $DOTFILES/gvimrc $HOME/.gvimrc

# zshrc
ln -s $DOTFILES/zshrc $HOME/.zshrc

# setup emacs
#ln -s $DOTFILES/emacsrc $HOME/.emacs
#ln -s $DOTFILES/emacs.d $HOME/.emacs.d
