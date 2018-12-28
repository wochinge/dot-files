#!/bin/bash

# Install homebrew 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew dependencies
brew install git
brew install python
brew install pyenv
brew cask install java # required for Java
brew install node
brew install poppler
brew install wget

# Brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

## Crucial
brew cask install dropbox
brew cask install google-chrome
brew cask install keeweb
brew cask install google-backup-and-sync
brew cask install keka
brew cask install skype
brew cask install franz
brew cask install gpg-suite

## Developer
brew cask install iterm2
brew cask install macdown
brew cask install visual-studio-code
brew cask install sequel-pro
brew cask install tunnelblick
brew cask install intel-haxm
brew cask install docker
brew cask install sourcetree
brew cask install insomnia
brew cask install mactex
brew cask install texstudio
brew cask install bear
brew install filezilla
brew install hub

## Fun
brew cask install vlc
brew cask install spotify
brew cask install teamviewer
brew cask install gimp
brew cask install calibre

# Python dependencies
pip3 install jupyter
pip3 install scikit-learn
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
