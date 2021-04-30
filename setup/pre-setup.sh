#!/bin/sh

wait_for_enter () {
while [ true ] ; do
	read -n 1
	if [[ $? == $'\x0a' ]]; then 
		break ;
	fi
	break;
done
}

SSH_FILE=~/.ssh/id_ed25519

printf "Checking for existing SSH key..\n"

if [[ -f "$SSH_FILE" ]]; then
	printf "Found $SSH_FILE!\n\n"
else
	printf "$SSH_FILE does not exist!\n"
	printf "Generating a new SSH key..\n"
	printf "Please enter your GitHub email (Used as key label):\n"
	read github_email
	printf "\nWhen you're prompted to \"Enter a file in which to save the key,\" press Enter. This accepts the default file location.\n"
	printf "At the prompt, \"Enter passphrase (empty for no passphrase)\", type a secure passphrase. For more information, see: https://docs.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases\n\n"
	ssh-keygen -t ed25519 -C $github_email
fi

printf "Adding your SSH key to the ssh-agent..\n"
printf "Starting ssh-agent in the background..\n"
eval "$(ssh-agent -s)"
ssh-add $SSH_FILE

printf "\nAdding the SSH key to your GitHub account..\n\n"
if ! command -v xclip &> /dev/null; then
	printf "xclip not found, please copy the public ssh key. When copying your key, don't add any newlines or whitespace:\n"
	cat $SSH_FILE.pub
	printf "Press [ENTER] to clear key from terminal.\n"
	wait_for_enter
	clear >$(tty)

else
	printf "Copying the content of your public key..\n"
	xclip -selection clipboard < $SSH_FILE.pub
fi

GITHUB="https://github.com/settings/keys"
GITHUB_INST="https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/"

if ! command -v xdg-open &> /dev/null
then
	printf "Please add key to GitHub: $GITHUB\n"
	printf "More instructions can be found here: $GITHUB_INST\n"
    continue ;
else
	printf "Please add key to GitHub.\n"
	printf "Press [ENTER] open GitHub and instructions.\n"
	wait_for_enter
	xdg-open $GITHUB_INST
	xdg-open $GITHUB
fi
printf "You can now close this terminal."
