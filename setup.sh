#!/usr/bin/env bash

spin()
{
  spinner="/|\\-/|\\-"
  while :
  do
    for i in `seq 0 7`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 1
    done
  done
}

spin &

SPIN_PID=$! 

trap "kill -9 $SPIN_PID" `seq 0 15`

#==============
# Variables
#==============
log_file=~/install_progress_log.txt
DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

#==============
# Install packages
#==============
echo "Installing packages.."

sudo apt -y install pandoc
if type -p pip > /dev/null; then
    echo "pandoc Installed" >> $log_file
else
    echo "Error: pandoc failed to install" >> $log_file
fi

sudo apt -y install python-pip
if type -p pip > /dev/null; then
    echo "pip Installed" >> $log_file
else
    echo "Error: pip failed to install" >> $log_file
fi

sudo apt -y install vim 
if type -p vim > /dev/null; then
    echo "Vim Installed" >> $log_file
else
    echo "Error: Vim failed to install" >> $log_file
fi

echo 'Install/Updating vim-plugins, this might take a while..'

vundlepath="~/.vim/bundle/Vundle.vim/"
if [ -d $vundlepath ]; then
	echo "Vundle Installed." >> $log_file
	vim +PluginUpdate +qall &>/dev/null
else
	echo "Vundle Installed." >> $log_file
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &>/dev/null 
	vim +PluginInstall +qall &>/dev/null
fi

sudo apt -y install tmux 
if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo "Error: tmux failed to install" >> $log_file
fi

#==============
# Symlinks
#==============
# Delete existing dot files and folders
#==============
echo "Creating symlinks.."

#==============
# Create symlinks in the home folder
#==============
# Dropbox
get_username=$(powershell.exe '$env:UserName') 
username=${get_username//$'\r'/}
LocalOneDrive=~/Dropbox
d1="/mnt/c/Dropbox"
d2="/mnt/c/Users/$username/Dropbox"

if [[ ! -e $LocalDropbox ]]; then
    if [[ -e $d1 ]]; then
        ln -s $d1 $LocalDropbox
    elif [[ -e $d2 ]]; then
        ln -s $d2 $LocalDropbox
    else
		echo "Error: Could not link Dropbox." >> $log_file
    fi
fi
# GoogleDrive
get_username=$(powershell.exe '$env:UserName') 
username=${get_username//$'\r'/}
LocalOneDrive=~/GoogleDrive
d1="/mnt/c/GoogleDrive"
d2="/mnt/c/Users/$username/GoogleDrive"
if [[ ! -e $LocalGoogleDrive ]]; then
    if [[ -e $d1 ]]; then
        ln -s $d1 $LocalGoogleDrive
    elif [[ -e $d2 ]]; then
        ln -s $d2 $LocalGoogleDrive
    else
		echo "Error: Could not link GoogleDrive." >> $log_file
    fi
fi
# OneDrive

get_username=$(powershell.exe '$env:UserName')
username=${get_username//$'\r'/}
LocalOneDrive=~/OneDrive
d1="/mnt/c/OneDrive"
d2="/mnt/c/Users/$username/OneDrive"
if [[ ! -e $LocalOneDrive ]]; then
    if [[ -e $d1 ]]; then
        ln -s $d1 $LocalOneDrive
    elif [[ -e $d2 ]]; then
        ln -s $d2 $LocalOneDrive
    else
		echo "Error: Could not link OneDrive." >> $log_file
    fi
fi

ln -sfn $DIR/.vimrc ~/ &>/dev/null
ln -sfn $DIR/.bashrc ~/ &>/dev/null
ln -sfn $DIR/.gitconfig ~/ &>/dev/null
ln -sfn $DIR/.tmux.conf ~/ &>/dev/null
ln -sfn $DIR/.gitignore_global ~/ &>/dev/null
git config --global core.excludesfile ~/.gitignore_global &>/dev/null

echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy"
rm $log_file
