#!/bin/sh

mkdir -p ~/.config/

CURRENT_DIR=$(cd $(dirname $0); pwd)

mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua
ln -s $CURRENT_DIR/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -s $CURRENT_DIR/.config/nvim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua
ln -s $CURRENT_DIR/.config/nvim/lua/plugins ~/.config/nvim/lua/plugins
ln -s $CURRENT_DIR/.config/nvim/lua/keymaps.lua ~/.config/nvim/lua/keymaps.lua
ln -s $CURRENT_DIR/.config/nvim/lua/lazyvim.lua ~/.config/nvim/lua/lazyvim.lua
ln -s $CURRENT_DIR/.config/nvim/lua/options.lua ~/.config/nvim/lua/options.lua

mkdir -p ~/.config/wezterm
ln -s $CURRENT_DIR/.config/wezterm/keybinds.lua ~/.config/wezterm/keybinds.lua
ln -s $CURRENT_DIR/.config/wezterm/mousebinds.lua ~/.config/wezterm/mousebinds.lua
ln -s $CURRENT_DIR/.config/wezterm/on.lua ~/.config/wezterm/on.lua
ln -s $CURRENT_DIR/.config/wezterm/utils.lua ~/.config/wezterm/utils.lua
ln -s $CURRENT_DIR/.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
# colorscheme
mkdir -p ~/.config/wezterm/lua
ln -s $CURRENT_DIR/.config/wezterm/lua/rose-pine-dawn.lua ~/.config/wezterm/lua/rose-pine-dawn.lua
ln -s $CURRENT_DIR/.config/wezterm/lua/rose-pine-moon.lua ~/.config/wezterm/lua/rose-pine-moon.lua
ln -s $CURRENT_DIR/.config/wezterm/lua/rose-pine.lua ~/.config/wezterm/lua/rose-pine.lua
ln -s $CURRENT_DIR/.config/wezterm/lua/aardvark_blue.lua ~/.config/wezterm/lua/aardvark_blue.lua

ln -sf $CURRENT_DIR/.zshrc ~/.zshrc
