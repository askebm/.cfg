# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
alias grep='grep --color '
alias 'ls=ls --color'
alias 'clipboard=xclip -selection clipboard'
alias 'ccat=pygmentize -g -O style=gruvbox '
alias	less='less -r'
alias config='/usr/bin/git --git-dir=/home/aske/.cfg/ --work-tree=/home/aske'
alias t='todo.sh'
#alias 'mbt=matlab -nodesktop -nosplash'
alias 'matlab=env LD_PRELOAD=/usr/lib/libfreetype.so.6 MATLAB_LOG_DIR=/tmp matlab'
mc() {mkdir ${1} && cd ${1};}
md() {pandoc -t asciidoc ${1} | /usr/bin/less -r;}
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[45;93m' \
    LESS_TERMCAP_se=$'\e[0m' \
    command man "$@"
}

#hook
prompt bart
source /usr/share/doc/pkgfile/command-not-found.zsh
zstyle ':completion:*' rehash true

PKG_CONFIG_PATH=/usr/lib/pkgconfig
#

export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim

#Qt5
export QT_QPA_PLATFORMTHEME=qt5ct

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Switch caps and escape
setxkbmap -option caps:escape

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh




