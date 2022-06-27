#! /bin/sh
sudo apt install curl
if [ ! -e "$HOME/.vim/autoload/plug.vim" ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
if [ ! -e "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# don't forget to run install with Ctrl+B-I in Tmux!
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# for the tool pdftotext, useful in git diffs
sudo apt install poppler-utils
sudo apt install zsh
sudo apt install vim
sudo apt install xclip

# dev stuff
sudo apt install build-essential python3-dev python3-virtualenvwrapper

./mksymlinks
touch ~/.zshrc_local
touch ~/.bashrc_local
mkdir -p ~/.goto
mkdir ~/.vimjunk
