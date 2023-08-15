#!/bin/sh

mkdir -p ~/.config/

CURRENT_DIR=$(cd $(dirname $0); pwd)

ln -s $CURRENT_DIR/.config/nvim ~/.config/nvim
ln -s $CURRENT_DIR/.config/wezterm ~/.config/wezterm
