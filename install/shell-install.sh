#/bin/sh
tput setaf 2 && echo "Installing yarn"
brew install yarn
tput setaf 2 && echo "Installing Fish"
brew install fish
ln -sf ~/dotfiles_mac/fish ~/.config/
ln -sf ~/dotfiles_mac/.bashrc ~/.bashrc
