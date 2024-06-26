function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "($venv) "
}
PS1='\n[\[\e[31m\]\D{%I:%M%p}\[\e[0m\]:bash] $(virtualenv_info)\[\e[92m\]\u\[\e[94m\]@\[\e[96m\]\h \[\e[33m\]\w \[\e[0m\]\n\$ '

# aliases that in zsh are provided by git plugin
alias gb='git branch'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gc='git commit -v'
alias gco='git checkout'
alias gc!='git commit -v --amend'
alias gd='git diff'
alias gl='git pull'
alias glog='git log --oneline --decorate --graph'
alias glogh='glog --color=always | head'
alias glogtime='git log --graph --pretty="%C(yellow)%h %C(green)%cd %C(white)%s%C(reset)'
alias glol='git log --graph --pretty="%Cred%h%Creset -%C(yellow)%d%C(reset) %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gp='git push'
alias gst='git status'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'

alias ls='ls --color=auto'
alias l='ls -alh'
alias ll='ls -lh'

alias agi='sudo apt install'
alias agr='sudo apt remove'
alias agu='sudo apt update'

source "$HOME/.common.sh"
set -o vi
source "$HOME/.bashrc_local"

# https://superuser.com/questions/561451/is-there-a-shell-which-supports-fuzzy-completion-as-in-sublime-text
function _fuzzypath() {
    if [ -z $2 ]
    then
        COMPREPLY=( $(ls) )
    else
        arg="$2"
        # split the directory out
        DIRPATH=$(echo "$arg" | sed 's|[^/]*$||')
        BASENAME=$(echo "$arg" | sed 's|.*/||')
        # FILTER=$(echo "$BASENAME" | sed 's|.|\0.*|g')
        # use eval so that "~" gets expanded
        # first try to match beginning of lines:
        COMPREPLY=( $(eval ls $DIRPATH | grep -i "^$BASENAME") )
        # if COMPREPLY is empty, match any part of the string
        if (( ! ${#COMPREPLY[@]} )); then
            COMPREPLY=( $(eval ls $DIRPATH | grep -i "$BASENAME" | sed "s|^|$DIRPATH|g") )
        fi
        if [ ! -z "$DEBUG_COMPLETION" ]; then
            echo >&2
            echo >&2 "DIRPATH $DIRPATH"
            echo >&2 "BASENAME $BASENAME"
            echo >&2 "COMPREPLY $COMPREPLY"
            echo >&2
        fi
    fi
}
# complete -o nospace -o filenames -F _fuzzypath cd ls cat cp mv bat

# evaluate a math expression
function _zc() {
    echo $(($*))
    set +f
}

source /etc/profile.d/bash_completion.sh
alias zc='set -f; _zc'
