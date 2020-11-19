
# Sets the NVM to the Fish.
function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent

# Setting Python3 as default python.
set -gx PATH $PATH /Users/rohan/Library/Python/3.6/bin

# Adds the local go bin installations to the path.
set GOBIN /Users/rohan/go/bin
set -gx PATH $PATH $GOBIN

# Sets Cargo executables to Path.
set -gx PATH $PATH $HOME/.cargo/bin

# Sets GO111MODULE to auto.
set GO111MODULE auto

if set -q TMUX
    set -x TERM xterm-256color
end

# Sets FZF commands to use ripgrep.
set FZF_DEFAULT_COMMAND 'rg --files  --follow --no-ignore-vcs'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

set fish_key_bindings fish_user_key_bindings

alias nvim=~/Downloads/nvim-osx64/bin/nvim

abbr v "$EDITOR"
abbr dc "docker-compose"

# Git abbreviations
abbr gco "git checkout"
abbr gl "git pull"
abbr gp "git push"
abbr gc "git checkout"
abbr gcb "git checkout -b"

# Tmux Abbreviations
abbr t "tmux"
abbr ta "tmux attach -t"
abbr tl "tmux ls"
abbr tls "tmux ls"

abbr e "exit"
