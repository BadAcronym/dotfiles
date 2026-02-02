#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -d "$HOME/.local/bin" ]
then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d "$HOME/repository/bash-collection" ]]
then
    export PATH="$HOME/repository/bash-collection:$PATH"
fi

if [[ -d "$HOME/repository/lib" ]]
then
    export PATH="$HOME/repository/lib:$PATH"
fi

export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer
export EDITOR=nvim
