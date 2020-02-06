#!/usr/bin/env bash

#==============
# Variables
#==============
dotfiles_dir=~/dotfiles
log_file=~/install_progress_log.txt

#==============
# Symlinks
#==============

echo "Creating symlinks.."

#==============
# Create symlinks in the home folder
#==============
ln -sf $dotfiles_dir/.vimrc ~/ &>/dev/null
echo ".vimrc linked." >> $log_file
ln -sf $dotfiles_dir/.bashrc ~/ &>/dev/null
echo ".bashrc linked." >> $log_file
ln -sf $dotfiles_dir/.bash_profile ~/ &>/dev/null
echo ".bash_profile linked." >> $log_file
ln -sf $dotfiles_dir/.gitconfig ~/ &>/dev/null
echo ".gitconfig linked." >> $log_file
ln -sf $dotfiles_dir/.tmux.conf ~/ &>/dev/null
echo ".tmux linked." >> $log_file
ln -sf $dotfiles_dir/.gitignore_global ~/ &>/dev/null
echo ".gitignore_global linked." >> $log_file
git config --global core.excludesfile ~/.gitignore_global &>/dev/null
echo "Updated git global config with .gitignore_global." >> $log_file

echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy"
rm $log_file
