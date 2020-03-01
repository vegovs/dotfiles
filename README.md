# Dotfiles and applications

Config files for:
* Git
* Vim
* bash
* tmux

Also installs a bunch of packages and other godies.

## Usage
Setup Github SSH keys.
```
wget -O /tmp/pre-setup.sh https://raw.githubusercontent.com/vegovs/dotfiles/master/setup/pre-setup.sh
bash /tmp/pre-setup.sh
```
Install:
```
git clone git@github.com:vegovs/dotfiles.git ~/dotfiles # Clone repo to home-folder
bash ~/dotfiles/setup/setup.sh
```
