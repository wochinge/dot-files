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

clean_branches () {
    git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d &&
    git remote prune origin
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
export PATH="$PATH:/Users/rasa/.local/bin"
# pyenv 
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Git aliases
alias ga="git add -p"
alias gco="git checkout"
alias gc="git commit -m"
alias gc!="git commit --amend"
alias gs="git status"
alias gps="git push"
alias gpl="git pull"

##### END application settings #####

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi
