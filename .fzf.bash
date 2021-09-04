# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hayapo/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/hayapo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/hayapo/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/hayapo/.fzf/shell/key-bindings.bash"
