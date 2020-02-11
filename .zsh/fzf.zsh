# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nico/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/nico/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/nico/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/nico/.fzf/shell/key-bindings.zsh"
