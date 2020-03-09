#!/bin/sh

source ~/dotfiles/setup/functions.sh

DIR="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))"

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

    fancy_echo "Swap caps:escape?"
    select yn in Yes No
    do
        case $yn in
            Yes)
                xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
                xmodmap -e "keycode 66 = Escape NoSymbol Escape"
                echo -e "xmodmap -e \"keycode 9 = Caps_Lock NoSymbol Caps_Lock\"" >> ~/.bash_profile
                echo -e "xmodmap -e \"keycode 66 = Escape NoSymbol Escape\"" >> ~/.bash_profile
                break;
                ;;
            No)
                break;
                ;;
        esac
    done

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
    echo "Enter your git name."
    read git_name
    echo "Enter your Github email."
    read git_email
    echo "Enter your Github username."
    read github_username
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
fancy_echo "Change git information?"
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
