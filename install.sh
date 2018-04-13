#! /bin/sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# for the tool pdftotext, useful in git diffs
sudo apt-get install poppler-utils

python3 ./create_symlinks.py -f

