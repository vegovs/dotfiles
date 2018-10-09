# dotfiles directory
DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

# Linux
echo "Installing software.."
apt install vim
apt install git
apt install tmux

echo "Linking $HOME/.bashrc"
ln -sfn $DIR/.bashrc ~/

echo "Linking $HOME/.vim"
ln -sfn $DIR/.vimrc ~/
echo "Installing vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim:w
echo "Setting up Vim"
vim +PluginInstall +qall

echo "Linking $HOME/.gitconfig"
ln -sfn ~/dotfiles/.gitconfig ~/
echo "Configuring global gitignore file"
ln -sfn ~/dotfiles/.gitignore_global ~/
git config --global core.excludesfile ~/.gitignore_global

echo "Linking $HOME/.tmux.conf"
ln -sfn ~/dotfiles/.tmux.conf ~/
