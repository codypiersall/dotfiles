# virtual environment
export WORKON_HOME=$HOME/.venvs

if [[ ${EUID} == 0 ]] ; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
fi

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

if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

set -o vi

source "$HOME/.bashrc_local"

# added by travis gem
[ -f /home/cody/.travis/travis.sh ] && source /home/cody/.travis/travis.sh
