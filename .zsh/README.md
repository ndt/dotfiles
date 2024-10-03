Install
-------

curl -L git.io/antigen > ~/.zsh/antigen.zsh


Usage
-----

Typical `.zshrc`:
```
source ~/.zsh//antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle systemd
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme gentoo

# Tell Antigen that you're done.
antigen apply

source ~/.zsh/aliases
source ~/.zsh/options
```
