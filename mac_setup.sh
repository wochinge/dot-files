#!/bin/bash

# Install homebrew 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew dependencies
brew install git
brew install python3
brew install pyenv
brew install java # required for Java
brew install node
brew install poppler
brew install wget
brew install ruby

# Brew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

## Crucial
brew install dropbox
brew install google-chrome
brew install keeweb
brew install google-backup-and-sync
brew install keka
brew install skype
brew install franz
brew install gpg-suite

## Developer
brew install iterm2
brew install macdown
brew install visual-studio-code
brew install tunnelblick
brew install intel-haxm
brew install docker
brew install github
brew install insomnia
brew install mactex
brew install texstudio
brew install filezilla
brew install dbeaver-community
brew install autojump
brew install kubectx
brew install gh
brew install websocat
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install bat


# Organizing
brew install 1password

## Fun
brew install vlc
brew install spotify
brew install teamviewer
brew install gimp
brew install calibre

# Python dependencies
pip3 install ipython
pip3 install jupyter
pip3 install scikit-learn
brew install pyenv
brew install pyenv-virtualenv
pip3 install virtualenv

# Visual studio code dependencies
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.code-spell-checker-german
code --install-extension ms-python.python
code --install-extension PeterJausovec.vscode-docker
code --install-extension MS-CEINTL.vscode-language-pack-de
code --install-extension James-Yu.latex-workshop

# ZSH
touch .hushlogin # suppress `last login` message
brew install zsh
brew install getantibody/tap/antibody
