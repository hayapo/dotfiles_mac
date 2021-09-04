#!/bin/sh

tput setaf 2 && echo "Updating apt"
sudo apt update && sudo apt -yV upgrade
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.hushlogin ~/.hushlogin
ln -sf ~/dotfiles/.profile ~/.profile
tput setaf 2 && echo "Installing System"
sudo apt-get install -y curl
sudo apt-get install -y wget
sudo apt-get install -y gcc
sudo apt-get install -y openssh-client
sudo apt-get install -y openssh-server
sudo apt-get install -y fonts-powerline

tput setaf 2 && echo "Do you want to install Neofetch?" && tput sgr0
select yn in "Yes" "No"; do
    case $yn in 
        Yes )
            sudo apt install -y neofetch
            ln -sf ~/dotfiles/neofetch ~/.config/
            break;;
        No ) break;;
    esac
done

tput setaf 2 && echo "Install firefox, vlc, krita, Spotify" && tput sgr0
sudo apt -y install firefox firefox-locale-ja
sudo snap install vlc
sudo snap install krita
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client