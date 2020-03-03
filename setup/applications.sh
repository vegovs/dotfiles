#!/bin/bash
#!/bin/sh

DIR="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))"
source $DIR/setup/functions.sh

if ! command -v git >/dev/null; then
    fancy_echo "Installing git ..."
    apt install git
fi

fancy_echo "Updating system."
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update && sudo apt upgrade -y

fancy_echo "Installing CLI tools"
sudo apt install openssl -y
sudo apt install bash -y
sudo apt install bash-completion -y
sudo apt install fzf -y
sudo apt install the_silver_searcher -y
sudo apt install wget -y
sudo apt install iftop -y
sudo apt install nethogs -y
sudo apt install htop -y
sudo apt install pandoc -y
sudo apt install fonts-powerline -y

fancy_echo "Installing python"
sudo apt install python -y
sudo apt install python3.7 -y

fancy_echo "Installing vim"
sudo apt install vim -y
sudo apt install vim-gui-common -y

fancy_echo "Setting up tmux"
sudo apt install tmux -y
sudo apt install tree -y

fancy_echo "Installing Misc Apps"
sudo apt install google-chrome-stable -y
sudo apt install libreoffice -y
sudo apt install dconf-tools -y

fancy_echo "Installing Jekyll"
sudo apt install ruby-full build-essential zlib1g-dev -y
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
gem install jekyll bundler

fancy_echo "Installing Anaconda"
CONDAPATH="$HOME/anaconda3"
if [ -d $CONDAPATH ]; then
    fancy_echo "Anaconda installed."
else
    wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh -O /tmp/anaconda.sh
    bash /tmp/anaconda.sh -p $CONDAPATH
fi

fancy_echo "Change wallpaper(Gnome desktop)?"
select yn in Yes No
do
    case $yn in
        Yes)
            echo "Changing wallpaper.."
            sudo cp $DIR/data/mojave-night.jpg /usr/share/backgrounds/ &>/dev/nul
            gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/mojave-night.jpg
            gsettings set org.gnome.desktop.screensaver picture-uri file:///usr/share/backgrounds/mojave-night.jpg
            break;
            ;;
        No)
            break;
            ;;
    esac
done
