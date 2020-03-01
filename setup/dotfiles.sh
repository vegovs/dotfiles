#!/bin/sh
source ~/dotfiles/setup/functions.sh

dotfiles=(
.bash_aliases
.bashrc
.gitignore_global
.gitconfig
.tmux.conf
.vimrc
)

fancy_echo "Backup current config"
today=`date +%Y%m%d`
for i in ${dotfiles[@]} ; do
    [ -e ~/$i ] && [ ! -L ~/$i ] && mv ~/$i ~/$i.bak.$today ;
    [ -L ~/$i ] && unlink ~/$i ;
done

fancy_echo "Symlinking dotfiles"
for i in ${dotfiles[@]} ; do
    ln -s ~/dotfiles/dots/$i ~/$i
done
