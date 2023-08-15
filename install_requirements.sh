#!/bin/sh

brew install neovim
brew install zsh
brew install --cask wezterm
brew install sk
brew install lazygit
brew install direnv
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
curl -sS https://starship.rs/install.sh | sh
