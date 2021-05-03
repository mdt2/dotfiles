# Path to your oh-my-zsh installation.
export ZSH="/Users/melissa/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# CUSTOM GIT ALIASES
  alias gs='git status'
  alias gll='git log'
  alias gl='git log --oneline'
  alias gpr='git pull --rebase'
  alias gca='git commit --amend'
  alias gb='git branch'
  alias gbd='git branch -d $@'
  alias gcb='git checkout -b $@'
  alias gco='git checkout $@'
  alias ga='git add .'
  alias gpu='git push --set-upstream origin $@'
  alias gro='git remote add origin $@'
  alias grv='git remote -v'
  alias gmf='git merge --ff-only $@'
  alias gpom='git push origin main'
  alias ga='git add $@'
  alias ga.='git add .'
  alias gca='git commit --amend -CHEAD'

# command line
  alias c='clear'
  alias lsd='ls -ld .?*'

# check for updates
  alias cupdates='sudo softwareupdate -l'

# check for and run updates
  alias supdate='sudo softwareupdate -ir --verbose'

unsetopt AUTO_CD

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.bin:$PATH"
