# common aliases/functions between bash and zsh
#
# .zshrc and .bashrc source this script.
# python virtualenv stuff
export VIRTUAL_ENV_DISABLE_PROMPT=1
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.7
export WORKON_HOME=~/.envs
export PROJECT_HOME=~/Dev
export PYTHONSTARTUP=~/.pythonrc
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_PAGER="less -RXF"
export DISABLE_AUTO_TITLE='true'
# makes Vim use fd (the Rust package) which is better because it respects
# gitignore
export FZF_DEFAULT_COMMAND='fd --type f'
mkdir -p $WORKON_HOME

# get virtualenvwrapper to work on different platforms
if [ -e "$HOME/.local/bin/virtualenvwrapper_lazy.sh" ]; then
    export VIRTUALENVWRAPPER_SCRIPT="$HOME/.local/bin/virtualenvwrapper.sh"
    export VIRTUALENVWRAPPER_VIRTUALENV="$HOME/.local/bin/virtualenv"
    source "$HOME/.local/bin/virtualenvwrapper_lazy.sh"
elif [ -e /usr/local/bin/virtualenvwrapper_lazy.sh ]; then
    export VIRTUALENVWRAPPER_SCRIPT="/usr/local/bin/virtualenvwrapper.sh"
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
    source /usr/local/bin/virtualenvwrapper_lazy.sh
elif [ -e /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
    # ubuntu 20.04 location
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.8
    export VIRTUALENVWRAPPER_SCRIPT=/usr/share/virtualenvwrapper/virtualenvwrapper.sh
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
    source /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh
fi

# ripgrep is dumb and doesn't have a default config file.
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"
# For colorized gcc output
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export EDITOR=nvim
export BROWSER=firefox

function pygrep () {
        if [ "$#" -lt "1" ]
        then
                return
        fi
        grep -n $* --exclude-dir=.git --include='*.py' --include='*.ipynb' --exclude-dir='.ipynb_checkpoints' -r .
}

function cgrep () {
        if [ "$#" -lt "1" ]
        then
                return
        fi
        grep -n $* --exclude-dir=.git --include='*.[ch]' --exclude-dir='.ipynb_checkpoints' -r .
}

function pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1:${PATH:+"$PATH:"}"
    fi
}

alias glogc='glog --color=always'
alias glogh='glog --color=always | head'
alias gstu='gst -uno'
alias lsd='ls -ald *'
alias f=fg
alias j=jobs
alias mmv='noglob zmv -W'
alias zc='setopt noglob; zc_'
alias vless='vim -u /usr/share/vim/vim74/macros/less.vim -'
alias tmux0='tmuxp load 0'
alias httpserver='python3 -m http.server'
alias glogtime="git log --graph --pretty='%C(yellow)%h %C(green)%cd %C(white)%s%C(reset)' --date=local"
alias psaf='ps -AF'
alias grep="grep '--exclude=*'{~,.o,.so,.ko} --color=auto '--exclude-dir='{.git,.hg,.svn,.ipynb_checkpoints}"
alias gitserver='git daemon --reuseaddr --base-path=. --export-all --verbose --enable=receive-pack'
alias xopen='xdg-open'
alias cclip='xclip -selection clipboard'
alias weather='curl wttr.in'

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

function fix_pdf_screenshot() {
    fname="$1"
    if [ -z "$fname" ]; then
        echo >&2 "no filename given"
        return 1
    fi
    # trims image
    convert "$fname" -fuzz '1%' -trim +repage "$fname"
    # change white to transparent
    convert "$fname" -fuzz 1% -transparent white "$fname"
}
pathadd "$HOME/.local/bin"
pathadd "$HOME/.cargo/bin"

function initgit() {
    git init
    for x in \
        '# C files' \
        .o .so .a .dll .lib \
        '' \
        '# Vim files' \
        '*.swp' '*~'; do
        echo "$x" >> .gitignore
    done
    git add .gitignore
    git commit -m 'Initial commit.'
}

if [ -e "$HOME/.config/broot/launcher/bash/br" ]; then
    source "$HOME/.config/broot/launcher/bash/br"
fi
