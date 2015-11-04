autoload -U compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt completealiases

if [ -f "$HOME/.host_color" ]; then
    HOST_COLOR=$(cat "$HOME/.host_color")
else
    HOST_COLOR=yellow
fi

export PROMPT="%B%F{red}%(?..%? )%f%b%B%F{red}%n%f%b@%F{$HOST_COLOR}%m %B%40<..<%~%<< %b%f%# "

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '

function change-host-color() {
    echo "$1" > "$HOME/.host_color"
    source "$HOME/.zshrc"
}

true
