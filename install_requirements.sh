#!/bin/sh

brew install neovim
brew install zsh
brew install --cask wezterm
brew install sk
brew install ripgrep
brew install lazygit
brew install direnv
brew install node
brew install luarocks
brew install pyenv
brew install poetry
brew install pandoc
brew install eza
brew install bat
npm install -g @compodoc/live-server
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
curl -sS https://starship.rs/install.sh | sh
