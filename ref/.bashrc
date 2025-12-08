# ~/.bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ---------------------------------------------
# Colors
# ---------------------------------------------
BLUE='\[\033[0;34m\]'
CYAN='\[\033[0;36m\]'
GREEN='\[\033[0;32m\]'
RESET='\[\033[0m\]'

# ---------------------------------------------
# Prompt: user@host in blue, directory in cyan
# ---------------------------------------------
PS1="${BLUE}\u@\h${RESET}:${CYAN}\w${RESET}\$ "

# ---------------------------------------------
# ls defaults
# ---------------------------------------------
alias ls='ls -lh --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'

# ---------------------------------------------
# History
# ---------------------------------------------
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth

# ---------------------------------------------
# Misc
# ---------------------------------------------
# Check window size after each command
shopt -s checkwinsize

# Enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

