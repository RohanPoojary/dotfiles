
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm use default --silent

# Setting Python3 as default python.
export PATH=$PATH:/Users/rohan/Library/Python/3.6/bin

# Adds the local go bin installations to the path.
export GOBIN=/Users/rohan/go/bin
export PATH=$PATH:$GOBIN

# Sets Cargo executables to Path.
export PATH=$PATH:$HOME/.cargo/bin

# Sets GO111MODULE to auto.
export GO111MODULE=auto

export EDITOR="nvim"
export TERM=xterm-256color
# if set -q TMUX
#     set -x TERM xterm-256color
# end

# Sets FZF commands to use ripgrep.
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export FZF_DEFAULT_COMMAND='rg --files  --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# set fish_key_bindings fish_user_key_bindings

# alias nvim=~/Downloads/nvim-osx64/bin/nvim

alias v="$EDITOR"
alias dc="docker-compose"

# # Git abbreviations
# abbr gco "git checkout"
# abbr gl "git pull"
# abbr gp "git push"
# abbr gc "git checkout"
# abbr gcb "git checkout -b"

eval $(thefuck --alias saav)

# Tmux Abbreviations
alias t="tmux"
alias ta="tmux attach -t"
alias tl="tmux ls"
alias tls="tmux ls"
alias e="exit"
alias f='v $(fzf -i)'
