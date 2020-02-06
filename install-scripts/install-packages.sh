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
dotfiles_dir=~/dotfiles

#==============
# Div configuration
#==============
echo "Changing wallpaper.."
sudo cp $dotfiles_dir/mojave-night.jpg /usr/share/backgrounds/ &>/dev/null
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/mojave-night.jpg
gsettings set org.gnome.desktop.screensaver picture-uri file:///usr/share/backgrounds/mojave-night.jpg

#==============
# Install packages
#==============
echo "Installing packages.."

sudo apt -y install vim
if type -p vim > /dev/null; then
    echo "vim Installed" >> $log_file
else
    echo "vim FAILED TO INSTALL!!!" >> $log_file
fi

echo 'Install/Updating vim-plugins, this might take a while..'

# Fix solarized colors error
mkdir ~/.vim/colors &>/dev/null
cp $dotfiles_dir/solarized.vim ~/.vim/colors/ &>/dev/null
vundlepath="~/.vim/bundle/Vundle.vim/"
if [ -d $vundlepath ]; then
	echo "Vundle Installed." >> $log_file
    vim +':silent! PlugInstall --sync' +qall
else
	echo "Installing Vundle." >> $log_file
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &>/dev/null 
    vim +':silent! PlugInstall --sync' +qall
fi

sudo apt -y install tmux 
if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo "Error: tmux failed to install" >> $log_file
fi

sudo apt -y install htop 
if type -p htop > /dev/null; then
    echo "htop Installed" >> $log_file
else
    echo "Error: htop failed to install" >> $log_file
fi

sudo apt -y install pandoc 
if type -p pandoc > /dev/null; then
    echo "pandoc Installed" >> $log_file
else
    echo "Error: pandoc failed to install" >> $log_file
fi

sudo apt -y install iftop 
if type -p iftop > /dev/null; then
    echo "iftop Installed" >> $log_file
else
    echo "Error: iftop failed to install" >> $log_file
fi

sudo apt-get -y install npm
if type -p npm > /dev/null; then
    echo "npm Installed" >> $log_file
else
    echo "npm FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install libreoffice
if type -p libreoffice > /dev/null; then
    echo "LibreOffice Installed" >> $log_file
else
    echo "LibreOffice FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install google-chrome-stable
if type -p google-chrome-stable > /dev/null; then
    echo "Google Chrome Installed" >> $log_file
else
    echo "Google Chrome FAILED TO INSTALL!!!" >> $log_file
fi

sudo snap install slack-term
if type -p slack-term > /dev/null; then
    echo "slack-term Installed" >> $log_file
else
    echo "slack-term FAILED TO INSTALL!!!" >> $log_file
fi

sudo npm install -g fb-messenger-cli
if type -p fb-messenger-cli > /dev/null; then
    echo "fb-messenger-cli Installed" >> $log_file
else
    echo "fb-messenger-cli FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt -y install dconf-tools
if type -p dconf > /dev/null; then
    echo "dconf-tools Installed" >> $log_file
	sudo dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:caps:swapescape']"
else
    echo "dconf-tools FAILED TO INSTALL!!!" >> $log_file
fi

echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy"
rm $log_file
#==============
# Install packages
#==============
echo "Installing packages.."

sudo apt -y install vim
if type -p vim > /dev/null; then
    echo "vim Installed" >> $log_file
else
    echo "vim FAILED TO INSTALL!!!" >> $log_file
fi

echo 'Install/Updating vim-plugins, this might take a while..'

# Fix solarized colors error
mkdir ~/.vim/colors &>/dev/null
cp $dotfiles_dir/solarized.vim ~/.vim/colors/ &>/dev/null
vundlepath="~/.vim/bundle/Vundle.vim/"
if [ -d $vundlepath ]; then
	echo "Vundle Installed." >> $log_file
    vim +':silent! PlugInstall --sync' +qall
else
	echo "Installing Vundle." >> $log_file
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &>/dev/null 
    vim +':silent! PlugInstall --sync' +qall
fi

sudo apt -y install tmux 
if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo "Error: tmux failed to install" >> $log_file
fi

sudo apt -y install htop 
if type -p htop > /dev/null; then
    echo "htop Installed" >> $log_file
else
    echo "Error: htop failed to install" >> $log_file
fi

sudo apt -y install pandoc 
if type -p pandoc > /dev/null; then
    echo "pandoc Installed" >> $log_file
else
    echo "Error: pandoc failed to install" >> $log_file
fi

sudo apt -y install iftop 
if type -p iftop > /dev/null; then
    echo "iftop Installed" >> $log_file
else
    echo "Error: iftop failed to install" >> $log_file
fi

sudo apt-get -y install npm
if type -p npm > /dev/null; then
    echo "npm Installed" >> $log_file
else
    echo "npm FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install libreoffice
if type -p libreoffice > /dev/null; then
    echo "LibreOffice Installed" >> $log_file
else
    echo "LibreOffice FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install google-chrome-stable
if type -p google-chrome-stable > /dev/null; then
    echo "Google Chrome Installed" >> $log_file
else
    echo "Google Chrome FAILED TO INSTALL!!!" >> $log_file
fi

sudo snap install slack-term
if type -p slack-term > /dev/null; then
    echo "slack-term Installed" >> $log_file
else
    echo "slack-term FAILED TO INSTALL!!!" >> $log_file
fi

sudo npm install -g fb-messenger-cli
if type -p fb-messenger-cli > /dev/null; then
    echo "fb-messenger-cli Installed" >> $log_file
else
    echo "fb-messenger-cli FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt -y install dconf-tools
if type -p dconf > /dev/null; then
    echo "dconf-tools Installed" >> $log_file
    dconf write "/org/gnome/desktop/input-sources/xkb-options" "['caps:swapescape']"
else
    echo "dconf-tools FAILED TO INSTALL!!!" >> $log_file
fi

echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy"
rm $log_file
