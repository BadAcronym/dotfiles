#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias vi='nvim'
alias ls='ls --color=auto'
alias dir='ls -la'
alias grep='grep --color=auto'
alias lazy='lazygit'
alias fetch='fastfetchconfig'
alias nitro='nitrogen-profile'
alias cdskse='cd ~/.local/share/Steam/steamapps/compatdata/489830/pfx/drive_c/users/steamuser/My\ Documents/My\ Games/Skyrim\ Special\ Edition/SKSE'
alias cdskseini='cd ~/.local/share/Steam/steamapps/compatdata/489830/pfx/drive_c/users/steamuser/My\ Documents/My\ Games/Skyrim.INI/SKSE'

export PAGER="less"
export GROFF_NO_SGR=1
export LESS_TERMCAP_mb=$'\033[01;32m'
export LESS_TERMCAP_md=$'\033[01;35m'
export LESS_TERMCAP_me=$'\033[0m'
export LESS_TERMCAP_se=$'\033[0m'
export LESS_TERMCAP_so=$'\033[01;34m'
export LESS_TERMCAP_ue=$'\033[0m'
export LESS_TERMCAP_us=$'\033[1;4;36m'

#for when oh-my-posh is unavailable
PS1='[\u@\h \W]\$ '

~/repository/gitfluss/bin/release/gitfluss --noinfo --noprofile --years 0
eval "$(oh-my-posh init bash --config '/home/mandi/repository/dotfiles/oh-my-posh/config.omp.json')"
