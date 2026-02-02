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
alias cdskse='cd ~/.local/share/Steam/steamapps/compatdata/489830/pfx/drive_c/users/steamuser/My\ Documents/My\ Games/Skyrim\ Special\ Edition/SKSE'

#for when oh-my-posh is unavailable
PS1='[\u@\h \W]\$ '

eval "$(oh-my-posh init bash --config '/home/mandi/repository/dotfiles/oh-my-posh/config.omp.json')"
