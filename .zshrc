source ~/.zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle 'ansible'
#antigen bundle 'colored-man-pages'
antigen bundle 'fd'
antigen bundle 'fz'
antigen bundle 'git'
antigen bundle 'gitignore'
antigen bundle 'github'
antigen bundle 'httpie'
antigen bundle 'rsync'
antigen bundle 'screen'
antigen bundle 'sudo'
antigen bundle 'systemd'
antigen bundle 'taskwarrior'
antigen bundle 'endaaman/lxd-completion-zsh'
#antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle 'zsh-users/zsh-syntax-highlighting'
antigen bundle "zsh-users/zsh-history-substring-search"


# Load the theme.
antigen theme gentoo

# Tell Antigen that you're done.
antigen apply

source ~/.zsh/history.zsh
source ~/.zsh/options.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/dircolors.zsh

[ -f ~/.zsh/local ] && source ~/.zsh/local
[ -f ~/.zsh/fzf.zsh ] && source ~/.zsh/fzf.zsh
[ -f ~/.config/mc/skin_solarized.ini ] && export MC_SKIN="$HOME/.config/mc/skin_solarized.ini"

# In WSL2 make pageant accessable
if ! command -v socat &> /dev/null
then
	echo "Install socat!"
fi
if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
	export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
	ss -a | grep -q $SSH_AUTH_SOCK
	if [ $? -ne 0 ]; then
		rm -f $SSH_AUTH_SOCK
		(setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:$HOME/.ssh/wsl2-ssh-pageant.exe >/dev/null 2>&1 &)
	fi
fi

if ! command -v neofetch &> /dev/null
then
	echo "neofetch could not be found. Install via e.g. 'apt install neofetch'"
	exit
else
	neofetch
fi

export PATH="$PATH:$HOME/.local/bin/:$HOME/go/bin"
