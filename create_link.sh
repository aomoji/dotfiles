#!/bin/sh

mkdir -p ~/.config/

CURRENT_DIR=$(cd $(dirname $0); pwd)

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua
ln -s $CURRENT_DIR/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s $CURRENT_DIR/.config/nvim/lua/plugin.lua ~/.config/nvim/lua/plugin.lua

mkdir -p ~/.config/wezterm
ln -s $CURRENT_DIR/.config/wezterm/keybinds.lua ~/.config/wezterm/keybinds.lua
ln -s $CURRENT_DIR/.config/wezterm/mousebinds.lua ~/.config/wezterm/mousebinds.lua
ln -s $CURRENT_DIR/.config/wezterm/on.lua ~/.config/wezterm/on.lua
ln -s $CURRENT_DIR/.config/wezterm/utils.lua ~/.config/wezterm/utils.lua
ln -s $CURRENT_DIR/.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua

ln -sf $CURRENT_DIR/.zshrc ~/.zshrc
