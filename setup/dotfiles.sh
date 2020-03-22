#!/bin/bash

DIR="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))"
source $DIR/setup/functions.sh

dotfiles=(
.bash_aliases
.bash_profile
.bashrc
.gitignore_global
.gitconfig
.tmux.conf
.vimrc
.doom.d
.editorconfig
)

fancy_echo "Backup current config"
today=`date +%Y%m%d`
for i in ${dotfiles[@]} ; do
    [ -e ~/$i ] && [ ! -L ~/$i ] && mv ~/$i ~/$i.bak.$today ;
    [ -L ~/$i ] && unlink ~/$i ;
done

fancy_echo "Symlinking dotfiles"
for i in ${dotfiles[@]} ; do
    ln -s $DIR/dots/$i ~/$i
done
