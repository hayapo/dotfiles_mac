alias open "explorer.exe"
set PATH $HOME/.cargo/env $PATH
set PATH /usr/local/bin/ecs-cli $PATH
set PATH $HOME/.local/bin/ $PATH
set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/.pyenv/bin $PATH
set PATH $HOME/anaconda3/bin $PATH
set PATH $HOME/miniforge3/bin $PATH
set -U FZF_LEGACY_KEYBINDINGS 0
set PATH /opt/homebrew/bin $PATH
set PATH $HOME/.nvm/bin $PATH
set -x MNE_DATASETS_SAMPLE_PATH '/Users/hayapo/mne_data'
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/opt/binutils/bin
set PATH $HOME/.nvm $PATH
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
eval (gh completion -s fish| source)

function llvm
    set PATH /usr/local/opt/llvm/bin $PATH
    set LDFLAGS -L/usr/local/opt/llvm/lib
    set CPPFLAGS -I/usr/local/opt/llvm/include
    set -e llvm
end

# cd > ls
function cd
    builtin cd $argv
        lsd --depth 1 -l
end

#alias exec
alias ex "exec $SHELL -l"

#alias lsd
alias lsd "lsd --tree -I "target" -I "node_modules" -I "fonts" -I "Downloads" "
alias ll "lsd --tree --depth 2"
alias ls "lsd --tree --depth 1"
alias lsl "ls -l"
alias lsa "ls -la"

#alias git 
alias gs "git status"
alias ga "git add"
alias gall "git add ."
alias gmc "gitmoji commit -c"
alias gp "git push"
alias gpmain "git push -u origin main"
alias gpmaster "git push -u origin master"
alias activate "source .venv/bin/activate.fish"

#alias pycharm
alias pycharm "pycharm-professional"

neofetch
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/hayapo/.miniforge3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
