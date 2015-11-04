#!/bin/sh

DEVOPS="$HOME/.devops"

if [ ! -z "$HOST_COLOR" ]; then
    echo "$HOST_COLOR" > "$HOME/.host_color"
fi

git clone https://github.com/darthdeus/devops.git "$DEVOPS"

ln -nsf "$DEVOPS/vimrc" "$HOME/.vimrc"
ln -nsf "$DEVOPS/zshrc" "$HOME/.zshrc"