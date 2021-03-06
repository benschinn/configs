# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/benschinn/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined-lambda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
# set git user
alias gse="git config user.email 'schinn.ben@gmail.com' && git config user.email"

alias lpid="cat /Users/ben.schinn/code/longbow/tmp/pids/server.pid"

alias bx="bundle exec"

run () {
  if [ -z "$1" ]; then
    echo "did you mean 'run server'?"
  else
    if [ "$1" = "server" ]; then 
      PB_CLIENT_TYPE=protobuf/nats/client bundle exec rails s
    elif [ "$1" = "docs" ]; then
      bundle exec middleman server
    elif [ "$1" = "redis" ]; then
      redis-server
    else
      echo "ERROR: no command 'run $1'"
    fi
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# erlang/elixir
# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash

# flutter
export PATH="$PATH:$HOME/projects/flutter/bin"

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
complete -W "$(cat ~/.tsh/complete.txt)" ssh #mx-teleport-bash-complete

tsh status | grep -q EXPIRED && printf "\e[93mYou need to run tlogin\e[0m\n" #mx-teleport-bash-notify

export PATH="$PATH:$HOME/bin" #mx-teleport-bin

alias consul="~/bin/consul"
alias terraform="~/bin/terraform"

alias python="/usr/local/bin/python3"

source /Users/benschinn/.pgvm/pgvm_env

alias oni="/Applications/Onivim2.app/Contents/MacOS/Oni2"

# Git
alias gp="git push"
alias gs="git status"
# alias gpsu="git push --set-upstream origin $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
#
#   $ cat .git-template/HEAD 
#   ref: refs/heads/main
#
alias gi="git init --template ~/.git-template"

# zsh
alias sz="source ~/.zshrc"
alias ez="vi ~/.zshrc"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# mx
alias nats="PB_CLIENT_TYPE=protobuf/nats/client PB_SERVER_TYPE=protobuf/nats/runner"
rootdir=~
mx() {
  "$rootdir/code/$1"
}

# go
export GO111MODULE="on"
export GOPRIVATE="gitlab.mx.com"
export GOPATH="$HOME/go"

# racket
alias racket="/Applications/Racket-v7.9/bin/racket"

# lambda
alias lambda="cd ~/projects/lambda-school"
alias new-html="cp ~/tmp/index.html"

# personal projects
ol() {
  "$rootdir/projects/occupied-lands/$1"
}

# Hook direnv into your shell.
eval "$(direnv hook zsh)"

#tmux
alias tmux-kill="tmux kill-session -a"

#db
export DATABASE_MAX_OPEN_CONNECTIONS=10
export RPC_WORKER_POOL_SIZE=10
