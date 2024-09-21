#!/bin/bash

function make_link() {
    src=$1
    dst=$2

    if [[ -e $dst && ! -L $dst ]]; then
        echo "$dst is not a symbolic link"
        return 1
    fi

    if [[ ! -e $(dirname $dst) ]]; then
        mkdir -p $(dirname $dst)
    fi

    if [[ -f $src ]]; then
        ln -sf $src $dst
    elif [[ -d $src ]]; then
        ln -nsf $src $dst
    fi
}

mkdir -p ~/.config/

CURRENT_DIR=$(
    cd $(dirname $0)
    pwd
)

make_link $CURRENT_DIR/.config/nvim ~/.config/nvim

make_link $CURRENT_DIR/.config/wezterm ~/.config/wezterm

make_link $CURRENT_DIR/.zshrc ~/.zshrc

