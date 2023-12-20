#!/usr/bin/sh

# you'll have to install rust itself before this step (obvi)
cargo install cargo-binstall
cargo binstall -y \
    bat \
    fd-find \
    ripgrep \
    rusty-tags

