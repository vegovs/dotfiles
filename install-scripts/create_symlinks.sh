#!/usr/bin/env bash

#==============
# Variables
#==============
dotfiles_dir=~/dotfiles

#==============
# Symlinks
#==============

echo "Creating symlinks.."

#==============
# Create symlinks in the home folder
#==============
ln -sf $dotfiles_dir/.vimrc ~/ &>/dev/null
ln -sf $dotfiles_dir/.bashrc ~/ &>/dev/null
ln -sf $dotfiles_dir/.gitconfig ~/ &>/dev/null
ln -sf $dotfiles_dir/.tmux.conf ~/ &>/dev/null
ln -sf $dotfiles_dir/.gitignore_global ~/ &>/dev/null
git config --global core.excludesfile ~/.gitignore_global &>/dev/null

echo -e "\n====== Summary ======\n"
echo
echo "Enjoy"
