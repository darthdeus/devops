autoload -U compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt completealiases

[ -f "$HOME/.host_color" ] && source "$HOME/.host_color"

HOST_COLOR="${HOST_COLOR:-yellow}"

export PROMPT="%B%F{red}%(?..%? )%f%b%B%F{red}%n%f%b@%F{$HOST_COLOR}%m %B%40<..<%~%<< %b%f%# "

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '

true