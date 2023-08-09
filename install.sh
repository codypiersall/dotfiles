#! /bin/sh
sudo apt install -y curl
if [ ! -e "$HOME/.vim/autoload/plug.vim" ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
if [ ! -e "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if ! which npm; then
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
    sudo npm install -g yarn
fi

mkdir ~/dev
git clone https://Gogh-Co/Gogh ~/dev/Gogh
sudo apt install -y dconf-cli uuid-runtime

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# don't forget to run install with Ctrl+B-I in Tmux!
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# for the tool pdftotext, useful in git diffs
sudo apt install -y poppler-utils
sudo apt install -y zsh
sudo apt install -y vim
sudo apt install -y neovim
sudo apt install -y xclip

# dev stuff
sudo apt install -y build-essential python3-dev python3-virtualenvwrapper

./mksymlinks
touch ~/.zshrc_local
touch ~/.bashrc_local
mkdir -p ~/.goto
mkdir ~/.vimjunk

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
sudo update-alternatives --set vim /usr/bin/nvim
sudo update-alternatives --set editor /usr/bin/nvim
