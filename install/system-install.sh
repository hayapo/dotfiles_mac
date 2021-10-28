#!/bin/sh

tput setaf 2 && echo "Install brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

tput setaf 2 && echo "Installing System"

tput setaf 2 && echo "Do you want to install Neofetch?" && tput sgr0
select yn in "Yes" "No"; do
    case $yn in 
        Yes )
            brew install neofetch
            ln -sf ~/dotfiles_mac/neofetch ~/.config/
            break;;
        No ) break;;
    esac
done

tput setaf 2 && echo "Install Spotify" && tput sgr0
brew install --cask spotify
brew install --cask rectangle
brew install --cask notion
brew install --cask clipy
brew install --cask kindle
brew install --cask zotero
brew install --cask obsidian