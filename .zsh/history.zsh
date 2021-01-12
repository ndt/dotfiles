# Optionen für die History
setopt append_history
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

bindkey '^[[A'  up-line-or-search
bindkey '^[[B'  down-line-or-search
