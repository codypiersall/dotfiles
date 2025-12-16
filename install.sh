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

# neovim repository
sudo add-apt-repository ppa:neovim-ppa/unstable -y

# installing nodejs: https://github.com/nodesource/distributions
sudo apt install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
# even-numbered node releases are LTS
NODE_MAJOR=24
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt update
sudo apt install nodejs -y

mkdir ~/dev
git clone https://github.com/Gogh-Co/Gogh ~/dev/Gogh
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
sudo apt install -y build-essential python3-dev python3-virtualenvwrapper cmake ninja-build clangd
sudo apt install -y jq

./mksymlinks
touch ~/.zshrc_local
touch ~/.bashrc_local
mkdir -p ~/.goto
mkdir ~/.vimjunk
mkdir -p ~/.local/bin

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
./install-rust-stuff.sh
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 110
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 110
sudo update-alternatives --set vim /usr/bin/nvim
sudo update-alternatives --set editor /usr/bin/nvim
