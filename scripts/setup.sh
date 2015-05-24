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
# Fix git formula
sed -i '' 126d ~/.brew/Library/Formula/git.rb
brew install git
cd ~/.brew && git reset --hard

brew install tree

# Tmux
ln -s ~/.dotfiles/tmux/.tmux.conf ~/
