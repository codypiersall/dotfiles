# virtual environment
export WORKON_HOME=$HOME/.venvs

PS1='[\[\e[31m\]\D{%I:%M%p}\[\e[0m\]] \[\e[92m\]\u\[\e[94m\]@\[\e[96m\]\h \[\e[33m\]\w \[\e[0m\]\$ '

export EDITOR=vim
export VIRTUAL_ENV_DISABLE_PROMPT=1
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/.envs
export PROJECT_HOME=~/Dev
export PYTHONSTARTUP=~/.pythonrc
mkdir -p $WORKON_HOME

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

alias j=jobs
alias f=fg
alias ls='ls --color=auto'
alias l='ls -alh'
alias ll='ls -lh'

alias agi='sudo apt install'
alias agr='sudo apt remove'
alias agu='sudo apt update'

if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

set -o vi

source "$HOME/.bashrc_local"

bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'set colored-stats on'

# added by travis gem
[ -f /home/cody/.travis/travis.sh ] && source /home/cody/.travis/travis.sh

cgrep () {
        if [ "$#" -lt "1" ]
        then
                return
        fi
        grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} -n $* --exclude-dir=.git --include='*.[ch]' --exclude-dir='.ipynb_checkpoints' -r .
}
yd() {
    diff -u $* | ydiff -s
}

# https://superuser.com/questions/561451/is-there-a-shell-which-supports-fuzzy-completion-as-in-sublime-text
function _fuzzypath() {
    if [ -z $2 ]
    then
        COMPREPLY=( $(ls) )
    else
        var="$2"
        var="${var/#\~/$HOME}"
        DIRPATH=$(echo "$var" | sed 's|[^/]*$||')
        BASENAME=$(echo "$var" | sed 's|.*/||')
        FILTER=$(echo "$BASENAME" | sed 's|.|\0.*|g')
        COMPREPLY=( $(ls $DIRPATH | grep -i "$FILTER" | sed "s|^|$DIRPATH|g") )
    fi
}
#complete -o nospace -o filenames -F _fuzzypath cd ls cat

# evaluate a math expression
function _zc() {
    echo $(($*))
    set +f
}

alias zc='set -f; _zc'
