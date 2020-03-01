# Unix
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias ...='../..'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -lh'
alias e="$EDITOR"
alias v="$VISUAL"

#Find pid
alias pf="ps -e | grep $1"

# Pretty print the path
alias path="echo $PATH | tr -s ':' '\n'"

# Navigation
alias cddot="cd ~/dotfiles"

# Go to the root of a project (git root)
alias root='cd $(git rev-parse --show-cdup)'

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#Find file containing word
alias ffcw="grep -nrH $1"

# Download silent
alias ds="wget -bqc $1"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
