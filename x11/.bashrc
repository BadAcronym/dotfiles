#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dir='ls -la'
alias vi='nvim'
alias lazy='lazygit'
alias fetch='fastfetchconfig'

#for when oh-my-posh is unavailable
PS1='[\u@\h \W]\$ '

export PATH="$PATH:~/repository/bash-collection/"
export PATH="$PATH:~/repository/lib/"

export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer

export EDITOR=nvim

fetch default
eval "$(oh-my-posh init bash --config '/home/mandi/repository/dotfiles/oh-my-posh/config.omp.json')"
