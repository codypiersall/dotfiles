#! /bin/sh
# neovim repository
sudo add-apt-repository ppa:neovim-ppa/unstable -y

sudo apt install -y tmux
sudo apt install -y ca-certificates curl gnupg

mkdir ~/dev
git clone https://github.com/Gogh-Co/Gogh ~/dev/Gogh
sudo apt install -y dconf-cli uuid-runtime

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# don't forget to run install with Ctrl+B-I in Tmux!
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# for the tool pdftotext, useful in git diffs
sudo apt install -y poppler-utils
sudo apt install -y zsh
sudo apt install -y neovim
sudo apt install -y xclip
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 100

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
export PATH="$PATH:$HOME/.cargo/bin"
./install-rust-stuff.sh

# fast node manager
curl -fsSL https://fnm.vercel.app/install | bash
export PATH="$PATH:$HOME/.local/share/fnm"
fnm install --lts
fnm default lts-latest
fnm use lts-latest

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh

