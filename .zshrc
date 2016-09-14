# set up oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.zsh_custom"
ZSH_THEME="mine"
plugins=(ubuntu git vim)

source $ZSH/oh-my-zsh.sh

# python virtualenv stuff
export VIRTUAL_ENV_DISABLE_PROMPT=1
export WORKON_HOME=~/.envs
mkdir -p $WORKON_HOME

if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

autoload -U zmv

export KEYTIMEOUT=10
export _current_dir="%F{blue}%~%f"
# For colorized gcc output
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export EDITOR=vim

#bindkey -M viins 'jk' vi-cmd-mode
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3;5~" delete-word

# do math calculations on arguments
function zc_() {
    print "$argv = $(echo $argv | bc -l)"
    setopt glob
}

function pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

alias pgrep='pgrep -l'
alias start_rpm_server='cd ~/yocto/poky/build/tmp/deploy/rpm; python -m SimpleHTTPServer'
alias glogc='glog --color=always'
alias glogh='glog --color=always | head'
alias lsd='ls -ald *'
alias f=fg
alias j=jobs
alias mmv='noglob zmv -W'
alias zc='setopt noglob; zc_'
alias vless='vim -u /usr/share/vim/vim74/macros/less.vim -'
alias tmux0='tmuxp load 0'

# Any changes that shouldn't be tracked can go in the local zshrc.
source "$HOME/.zshrc_local"
