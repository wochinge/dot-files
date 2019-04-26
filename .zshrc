##### START ZSH configuration #####
# Using https://github.com/getantibody/antibody with static imports
source ~/.zsh_plugins.sh

alias update_antibody='antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh && source ~/.zsh_plugins.sh'

# for zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# support for autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

##### END ZSH configuration #####

##### START utility functions #####
pyclean () {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}
##### END utility functions #####

##### START local configuration #####
LOCAL_CONFIG_FILE=.zshrc_local
if [ -f $LOCAL_CONFIG_FILE ]; then
    source $LOCAL_CONFIG_FILE
fi
##### END local configuration #####

##### START application settings #####

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home

# Install hombrew casks in application dir
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# pyenv 
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Git aliases
alias ga='git add -p'
alias gco='git checkout'
alias gc='git commit -m'
alias gs='git status'
alias gp='git push'

##### END application settings #####
