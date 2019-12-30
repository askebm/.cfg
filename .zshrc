# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/aske/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
unsetopt beep


# Enbable vi mode
bindkey -v
# Enable Ctrl-R for reverse search
bindkey '^R' history-incremental-search-backward

#Prompt
autoload -Uz promptinit
promptinit

# Enable edit commandline in vim
autoload -U edit-command-line
zle -N edit-command-line
#bindkey -M vicmd v edit-command-line
bindkey '^x^e' edit-command-line

#Alias
alias 'ls=ls --color'
alias 'clipboard=xclip -selection clipboard'
alias 'ccat=highlight -O ansi'
#alias 'mbt=matlab -nodesktop -nosplash'
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

export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim

#Qt5
export QT_QPA_PLATFORMTHEME=qt5ct

# Switch caps and escape
setxkbmap -option caps:escape
