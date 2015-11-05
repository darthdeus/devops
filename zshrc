autoload -U compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt completealiases

unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

bindkey -e

fpath=($fpath "$HOME/.devops/functions")

autoload -U promptinit
promptinit
prompt darth
prompt darth

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '

function change-host-color() {
    echo "$1" > "$HOME/.host_color"
    source "$HOME/.zshrc"
}

function devops-reload() {
    cd "$HOME/.devops"
    git pull
    source "$HOME/.zshrc"
}

true
