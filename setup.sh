# dotfiles directory
DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)


# Linux
echo -ne '##                    (10%)\r'
apt install vim -y &>/dev/null
echo -ne '####                  (20%)\r'
apt install tmux -y &>/dev/null
echo -ne '######                (30%)\r'
ln -sfn $DIR/.bashrc ~/ &>/dev/null
echo -ne '########              (40%)\r'
ln -sfn $DIR/.vimrc ~/ &>/dev/null
echo -ne '##########            (50%)\r'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo -ne '############          (60%)\r'
vim +PluginInstall +qall &>/dev/null
echo -ne '##############        (70%)\r'
ln -sfn ~/dotfiles/.gitconfig ~/ &>/dev/null
echo -ne '################      (80%)\r'
ln -sfn ~/dotfiles/.gitignore_global ~/ &>/dev/null
echo -ne '##################    (90%)\r'
git config --global core.excludesfile ~/.gitignore_global &>/dev/null

ln -sfn ~/dotfiles/.tmux.conf ~/ &>/dev/null
echo -ne '####################  (100%)\r'
echo -ne '\n'
