#!/bin/sh

DEVOPS="$HOME/.devops"

if [ ! -z "$HOST_COLOR" ]; then
    echo "$HOST_COLOR" > "$HOME/.host_color"
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$HOME/.vim/backup"

if [ ! -d "$DEVOPS" ]; then
    git clone https://github.com/darthdeus/devops.git "$DEVOPS"
fi

ln -nsf "$DEVOPS/vimrc" "$HOME/.vimrc"
ln -nsf "$DEVOPS/zshrc" "$HOME/.zshrc"

source "$HOME/.zshrc"
