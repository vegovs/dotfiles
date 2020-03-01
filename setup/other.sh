#!/bin/bash

DIR="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))"
echo $DIR

source $DIR/setup/functions.sh

fancy_echo "Setting up tmux plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fancy_echo "Done setting up tmux plugins"

fancy_echo "Installing Bash-it"
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --silent --no-modify-config
fancy_echo "Done installing Bash-it"

fancy_echo "Setting up vim"
mkdir ~/.vim/colors &>/dev/null
cp $DIR/data/solarized.vim ~/.vim/colors/

VDIR="$HOME/.vim/bundle/Vundle.vim/"
if [ -d $VDIR ];
then
    fancy_echo "Updating plugins."
    vim +':silent! PlugInstall --sync' +qall
    fancy_echo "Done updating plugins."
else
    fancy_echo "$VDIR not found\n Installing Vundle and updating plugins."
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    vim +':silent! PlugInstall --sync' +qall &> /dev/null
    fancy_echo "Done installing Vundle."
fi
fancy_echo "Done setting up vim"
