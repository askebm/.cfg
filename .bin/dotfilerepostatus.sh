#!/usr/bin/env bash
shopt -s expand_aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
TEXT=""
if [ $(config status --ignore-submodules | grep "nothing to commit" | wc -l) -eq 0 ]
then
    #modified
    TEXT="%{u#ff4b14}%{F-}"
fi
alias vimconf='/usr/bin/git --git-dir=$HOME/.vim/.git/ --work-tree=$HOME/.vim/'
if [ $(vimconf status --ignore-submodules | grep "nothing to commit" | wc -l) -eq 0 ]
then
    #modified
    TEXT=${TEXT}"%{u#ff4b14}%{F-}"
fi

#if [ $(config push -n 2>1 | grep "Everything up-to-date" | wc -l) -eq 1 ]
#then
#    # not modified
#    TEXT="$TEXT"
#else
#    #modified
#    TEXT="%{B#ffffff}"
#fi
echo -e $TEXT
