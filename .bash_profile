# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export LS_COLORS="di=01;36"
export PS1='[\u@\h \W$(__git_ps1 " (\[\033[32m\]%s\[\033[00m\])")]\$ '

PATH=$PATH:$HOME/bin
export PATH
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

export EDITOR=/usr/local/bin/vim

