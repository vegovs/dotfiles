#!/bin/sh

DIR="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))"
source $DIR/setup/functions.sh

func_install() {
    fancy_echo "Link dotfiles and fix configs?"
    select yn in Yes No
    do
        case $yn in
            Yes)
                source $DIR/setup/dotfiles.sh
                source $DIR/setup/other.sh
                break;
                ;;
            No)
                break;
                ;;
        esac
    done
    fancy_echo "Done linking dotfiles and fix configs."

    fancy_echo "Install applications?(Need sudo)?"
    select yn in Yes No
    do
        case $yn in
            Yes)
                source $DIR/setup/applications.sh
                break;
                ;;
            No)
                break;
                ;;
        esac
    done
    fancy_echo "Done installing applications."
}

func_read_gitinfo() {
    echo "Enter your Github username."
    read github_username
    echo "Enter your Github email."
    read git_email
    echo "Enter your GitHub name."
    read git_name
    touch $DIR/gitconfig.local
    echo "[user]" >> $DIR/gitconfig.local
    echo "  name = $git_name" >> $DIR/gitconfig.local
    echo "  email = $git_email" >> $DIR/gitconfig.local
    echo "[github]" >> $DIR/gitconfig.local
    echo "  user = $github_username" >> $DIR/gitconfig.local
}

echo $DIR

echo "[User]
$(git config --global user.name)
$(git config --global user.email)
[github]
$(git config --global github.user)"
fancy_echo "Do you wish to change the current GitHub information?"
select yn in Yes No
do
    case $yn in
        Yes)
            func_read_gitinfo
            func_install
            break;
            ;;
        No)
            func_install
            break;
            ;;
    esac
done
