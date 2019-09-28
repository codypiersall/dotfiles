#! /bin/sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# don't forget to run install with Ctrl+B-I in Tmux!
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# for the tool pdftotext, useful in git diffs
sudo apt-get install poppler-utils
sudo apt-get install zsh
sudo apt-get install vim
sudo apt-get install xclip

python3 ./create_symlinks.py -f
touch ~/.zshrc_local
mkdir -p ~/.goto

