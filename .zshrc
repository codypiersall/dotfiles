# set up oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.zsh_custom"
ZSH_THEME="mine"
plugins=(ubuntu git vim)
# fpath=($ZSH_CUSTOM/completion $fpath)
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# python virtualenv stuff
export VIRTUAL_ENV_DISABLE_PROMPT=1
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/.envs
export PROJECT_HOME=~/Dev
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

# zsh on WSL
bindkey "^[[C" forward-word
bindkey "^[OC" forward-char
bindkey "^[[D" backward-word
bindkey "^[OD" backward-char

function pygrep () {
        if [ "$#" -lt "1" ]
        then
                return
        fi
        grep -n $* --exclude-dir=.git --include='*.py' --include='*.ipynb' --exclude-dir='.ipynb_checkpoints' -r .
}

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


function cleanup() {
    # removes lots of files generated by making a driver, plus backup (temp) files.
    # do it in a sub shell so that
    ( setopt null_glob
      rm -rf *.pyc *.o .*.o *.cmd .*.cmd .tmp_versions Module.symvers modules.order *.mod.c *~ .*~
    )
}

_gotoerrmsg() {
    echo >&2 "ERROR: $funcstack[2] requires an argument"
}

function goto() {
    if [ $# -lt 1 ]; then
        print -rl -- $(cd  ~/goto; ls *[^~])
        return
    fi
    cd "$(cat ~/goto/$1)"
}

function setgoto() {
    if [ $# -lt 1 ]; then
        _gotoerrmsg
        return
    fi
    pwd > ~/goto/$1
}

function rmgoto() {
    if [ $# -lt 1 ]; then
        _gotoerrmsg
        return
    fi
    rm ~/goto/$1
}

alias glogc='glog --color=always'
alias glogh='glog --color=always | head'
alias lsd='ls -ald *'
alias f=fg
alias j=jobs
alias mmv='noglob zmv -W'
alias zc='setopt noglob; zc_'
alias vless='vim -u /usr/share/vim/vim74/macros/less.vim -'
alias tmux0='tmuxp load 0'
alias httpserver='python -m http.server'

# Any changes that shouldn't be tracked can go in the local zshrc.
source "$HOME/.zshrc_local"

alias glogtime="git log --graph --pretty='%C(yellow)%h %C(green)%cd %C(white)%s%C(reset)' --date=local"

# added by travis gem
[ -f /home/cody/.travis/travis.sh ] && source /home/cody/.travis/travis.sh

# Codi
# Usage: codi [filetype] [filename]
function codi() {
    local syntax="python"
    if [ $# -ge 1 ]; then
        local syntax="${1}"
        shift
    fi
    vim -c \
        "let g:startify_disable_at_vimenter = 1 |\
        set bt=nofile ls=0 noru nonu nornu |\
        hi ColorColumn ctermbg=NONE |\
        hi VertSplit ctermbg=NONE |\
        hi NonText ctermfg=0 |\
        Codi $syntax" "$@"
}
alias psaf='ps -AF'
