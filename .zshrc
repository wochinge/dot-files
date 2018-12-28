##### START ZSH configuration #####
# Using https://github.com/getantibody/antibody with static imports
source ~/.zsh_plugins.sh

alias update_antibody='antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh && source ~/.zsh_plugins.sh'

# for zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

##### END ZSH configuration #####

##### START application settings #####

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home

# Install hombrew casks in application dir
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# pyenv 
eval "$(pyenv init -)"

# use github cli https://hub.github.com/
alias git=hub
##### END application settings #####
