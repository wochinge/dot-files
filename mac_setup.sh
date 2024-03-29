#!/bin/bash

# Install homebrew 

# Brew dependencies
brew install git
brew install pyenv
brew install java # required for Java
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
brew install node
brew install wget
brew install ruby

# Brew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

## Crucial
brew install dropbox
brew install google-chrome
brew install google-drive
brew install keka
brew install skype
brew install slack
brew install fork
brew install rectangle
brew install contexts
brew install alfred

## Developer
brew install iterm2
brew install macdown
brew install visual-studio-code
brew install docker
brew install github
brew install insomnia
brew install dbeaver-community
brew install zoxide
brew install kubectx
brew install gh
gh extension install mislav/gh-branch
brew install websocat
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install bat
brew install htop

# Organizing
brew install 1password

## Fun
brew install vlc
brew install spotify
brew install teamviewer
brew install calibre
brew install miro
brew install zoom
brew install signal

# Python
brew install pyenv
brew install pyenv-virtualenv
pyenv install 3.8.10
pyenv virtualenv 3.8.10 rasa

# Visual studio code dependencies
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.code-spell-checker-german
code --install-extension ms-python.python
code --install-extension PeterJausovec.vscode-docker
code --install-extension MS-CEINTL.vscode-language-pack-de
code --install-extension jebbs.plantuml
brew install graphviz # required for plantuml

# ZSH
touch .hushlogin # suppress `last login` message
brew install zsh

# https://github.com/romkatv/zsh4humans
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi
