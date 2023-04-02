#!/bin/sh

brew install --cask wezterm
brew install sk
brew install lazygit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
