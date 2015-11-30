# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# User specific aliases and functions
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias ls='ls -F --color'
alias la='ls -a'
alias ll='ls -l'
alias tree='tree -CF'

alias vi='vim'
alias evi='vim ~/.vimrc'
alias pd='perldoc'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gls='git log --stat'

