#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# NEOVIM
if [ ! -f $HOME/.config/nvim/init.lua ]; then
    mkdir -p $HOME/.config/nvim
    cp -r $DIR/nvim $HOME/.config/
fi

# TMUX
TMUX_DIR=$DIR/.tmux

ln -s -f $TMUX_DIR/.tmux.conf $HOME/.tmux.conf

if [ ! -f $HOME/.tmux.conf.local ]; then
    cp $TMUX_DIR/.tmux.conf.local $HOME/.tmux.conf.local
fi
