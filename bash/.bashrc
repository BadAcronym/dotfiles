#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$PATH:~/repository/PWSH-Collection/scripts/"
export PATH="$PATH:~/repository/bash-collection/"

export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer

export EDITOR=nvim
