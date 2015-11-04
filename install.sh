#!/bin/sh

DEVOPS="$HOME/.devops"

git clone https://github.com/darthdeus/devops.git "$DEVOPS"

ln -nsf "$DEVOPS/vimrc" "$HOME/.vimrc"
ln -nsf "$DEVOPS/zshrc" "$HOME/.zshrc"

vim +:PlugInstall
