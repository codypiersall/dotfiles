# virtual environment
export WORKON_HOME=$HOME/.venvs

parent="$(ps -o comm= $PPID)"
if [ \( "$parent" = "init" -o "$parent" = "tmux" \) -a -t 1 -a -e /mnt/c ]; then
    if which zsh; then
        exec zsh
    fi
fi

if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

set -o vi
