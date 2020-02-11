source ~/.zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle 'ansible'
#antigen bundle 'colored-man-pages'
antigen bundle 'fd'
antigen bundle 'fz'
antigen bundle 'git'
antigen bundle 'httpie'
antigen bundle 'rsync'
antigen bundle 'screen'
antigen bundle 'sudo'
antigen bundle 'svn'
antigen bundle 'systemd'
antigen bundle 'taskwarrior'
antigen bundle 'endaaman/lxd-completion-zsh'
#antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle 'zsh-users/zsh-syntax-highlighting'

# Load the theme.
antigen theme gentoo

# Tell Antigen that you're done.
antigen apply


# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)

# Customize to your needs...

source ~/.zsh/options
source ~/.zsh/aliases
source ~/.zsh/dircolors

neofetch

[ -f ~/.zsh/fzf.zsh ] && source ~/.zsh/fzf.zsh
