# Dotfiles 

Some config files for: 
* Git
* Vim
* bash
* tmux

Also installs a bunch of packages, tries to swap caps<->escape and changes the wallpaper.

## Install 
Create symbolic links for the dotfiles:
```
cd
git clone https://github.com/vegovs/dotfiles.git
cd dotfiles/install-scripts
bash create_symlinks.sh
```
Installs packages and other stuff:
```
bash install_packages.sh
```
