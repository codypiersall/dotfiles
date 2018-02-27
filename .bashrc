# virtual environment
export WORKON_HOME=$HOME/.venvs

parent="$(ps -o comm= $PPID)"
if [ \( "$parent" = "init" -o "$parent" = "tmux" \) -a -t 1 -a -e /mnt/c ]; then
    if which zsh; then
        exec zsh
    fi
fi

if [[ ${EUID} == 0 ]] ; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
fi

if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

set -o vi
