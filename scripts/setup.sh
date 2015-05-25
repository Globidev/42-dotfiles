#! /usr/bin/env bash

set -e

# Install Oh-My-Zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
ln -s ~/.dotfiles/zsh/custom/*.zsh ~/.oh-my-zsh/custom
rm ~/.zshrc && ln -s ~/.dotfiles/zsh/.zshrc ~/

# Install stuff
brew update

brew install tmux
brew install htop
brew install tree
brew install fswatch
brew install nload

# Fix git formula
sed -i '' 126d ~/.brew/Library/Formula/git.rb
brew install git
cd ~/.brew && git reset --hard

# Tmux
ln -s ~/.dotfiles/tmux/.tmux.conf ~/

# local bin folder
mkdir ~/bin

# Atom
curl -L https://github.com/atom/atom/releases/download/v0.201.0/atom-mac.zip -o ~/bin/atom-mac.zip
unzip ~/bin/atom-mac.zip -d ~/bin
rm ~/bin/atom-mac.zip
