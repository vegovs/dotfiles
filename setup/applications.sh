#!/bin/bash

DIR="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))"
source $DIR/setup/functions.sh

fancy_echo "Updating system."
sudo apt update

fancy_echo "Installing div CLI tools and packages."
sudo apt install openssl -y
sudo apt install bash -y
sudo apt install bash-completion -y
sudo apt install fzf -y
sudo apt install wget -y
sudo apt install iftop -y
sudo apt install nethogs -y
sudo apt install htop -y
sudo apt install pandoc -y
sudo apt install fonts-powerline -y
sudo apt install git-flow -y
sudo apt install python -y
sudo apt install python3.8 -y
sudo apt install python3-pip -y
sudo pip3 install -U Commitizen
sudo apt install tmux -y
sudo apt install tree -y
sudo apt install vim -y
sudo apt install vim-gui-common -y
sudo apt install gnome-tweaks -y
sudo apt install google-chrome-stable -y
sudo apt install unzip -y

fancy_echo "Install GitHub CLI?"
select yn in Yes No
do
case $yn in
    Yes)
        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
        sudo apt-add-repository https://cli.github.com/packages
        sudo apt update
        sudo apt install gh
        break;
    ;;
    No)
        break;
        ;;
esac
done
fancy_echo "Done."

fancy_echo "Install Anaconda?"
select yn in Yes No
do
case $yn in
    Yes)
        wget -O /tmp/anaconda_installer.sh https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh
        bash /tmp/anaconda_installer.sh
        break;
        ;;
    No)
        break;
        ;;
esac
done
fancy_echo "Done."

fancy_echo "Install Syncthing?"
select yn in Yes No
do
case $yn in
    Yes)
        sudo apt-get install apt-transport-https
        sudo curl -s -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
        echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
        printf "Package: *\nPin: origin apt.syncthing.net\nPin-Priority: 990\n" | sudo tee /etc/apt/preferences.d/syncthing
        sudo apt-get update
        sudo apt-get install syncthing
        break;
        ;;
    No)
        break;
        ;;
esac
done
fancy_echo "Done."
