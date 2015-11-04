autoload -U compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt completealiases

export PROMPT="%B%F{red}%(?..%? )%f%b%B%F{red}%n%f%b@%F{yellow}%m %B%40<..<%~%<< %b%f%# "

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '

true