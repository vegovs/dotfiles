#!/usr/bin/env bash

#==============
# Variables
#==============
dotfiles_dir=~/dotfiles
log_file=~/install_progress_log.txt
DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

#==============
# Symlinks
#==============
# Delete existing dot files and folders
#==============
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1

echo "Creating symlinks.."

#==============
# Create symlinks in the home folder
#==============
ln -sf $DIR/.vimrc ~/ &>/dev/null
ln -sf $DIR/.bashrc ~/ &>/dev/null
ln -sf $DIR/.gitconfig ~/ &>/dev/null
ln -sf $DIR/.tmux.conf ~/ &>/dev/null
ln -sf $DIR/.gitignore_global ~/ &>/dev/null
git config --global core.excludesfile ~/.gitignore_global &>/dev/null

echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy"
rm $log_file
