# virtual environment
export WORKON_HOME=$HOME/.venvs

parent="$(ps -o comm= $PPID)"
if [ "$parent" = "init" -a -t 1 -a -e /mnt/c ]; then
    exec zsh
fi

if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

set -o vi
