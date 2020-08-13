# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##### START ZSH configuration #####
# Using https://github.com/getantibody/antibody with static imports
source ~/.zsh_plugins.sh

alias update_antibody='antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh && source ~/.zsh_plugins.sh'

# for zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# support for autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# allow comments in interactive shells (like Bash does)
setopt INTERACTIVE_COMMENTS

##### END ZSH configuration #####

##### START utility functions #####
pyclean () {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}

git_checkout_based_on_pattern () {
    matching_branch=$(echo $(git branch -a | grep -m 1 "$1"))
    git checkout ${matching_branch}
}

# Get latest x branch
latest_x_branch () {
    latest_tag=$(git describe --tags --abbrev=0 --exclude "*a*" $(git rev-list --tags --max-count=1))
    echo ${latest_tag%.*}.x
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
alias gco="git switch"
alias gcol="git switch @{-1}" # checkout last branch
alias gcox='git switch $(latest_x_branch)'
alias gcor='git_checkout_based_on_pattern'
alias gc="git commit"
alias gc!="git commit --amend"
alias gbd='git fetch -p; git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias gs="git status"
alias gps="git push"
alias gpl="git pull --ff-only"
alias gplr="git pull --rebase"
alias gr!="git reset --hard"
alias gplf="git fetch && git reset --hard origin/$(git rev-parse --abbrev-ref HEAD) && git pull"
alias gcom="git checkout master"
alias gmm="git merge master"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gd="git diff --word-diff=color"

# Pyenv alias
alias pa="pyenv activate"

# docker / cluster aliases
alias dc="docker-compose"
alias k="kubectl"
alias kns="kubens"
alias ktx="kubectx"
alias wp="watch kubectl get pods"
# # Other alias
alias ls="ls -alGh"

# Kubectl autocomplete (https://kubernetes.io/docs/tasks/tools/install-kubectl/)
source <(kubectl completion zsh)
complete -F __start_kubectl k

##### END application settings #####

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

export RASA_X_PASSWORD="test"

# Rasa CLI completion script
source /Users/tobias/Workspace/rasa-cli-completion/rasa_cli_completion/rasa-complete.sh
export RASA_COMPLETE_SCRIPT=/Users/tobias/Workspace/rasa-cli-completion/rasa_cli_completion/rasa_complete.py

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use ruby from brew and not the default mac one
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

# added by travis gem
[ -f /Users/tobias/.travis/travis.sh ] && source /Users/tobias/.travis/travis.sh
