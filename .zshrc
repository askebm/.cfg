# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/aske/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
#Prompt
autoload -Uz promptinit
promptinit
#Alias
alias 'ls=ls --color'
alias 'clipboard=xclip -selection clipboard'
alias 'matlab=env LD_PRELOAD=/usr/lib/libfreetype.so.6 MATLAB_LOG_DIR=/tmp matlab'
#hook
prompt bart
source /usr/share/doc/pkgfile/command-not-found.zsh
zstyle ':completion:*' rehash true
PKG_CONFIG_PATH=/usr/lib/pkgconfig
#Git
source /usr/lib/zsh-git-prompt/zshrc.sh
# an example prompt
PROMPT='$(git_super_status) %# '
alias config='/usr/bin/git --git-dir=/home/aske/.cfg/ --work-tree=/home/aske'
alias todo='todo.sh'

VISUAL=vim
EDITOR=vim

# Gazebo setup
source /usr/share/gazebo/setup.sh
