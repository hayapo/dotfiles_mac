#/bin/sh
tput setaf 2; echo "Do you want to install rust and rustup.rs"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

            rustup install nightly

            cargo install starship
            ln -sf ~/dotfiles_mac/starship.toml ~/.config/starship.toml
            cargo install exa
            cargo install lsd
            break;;
        No ) break;;
    esac
done

tput setaf 2; echo "Do you want to install docker"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
            sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
            sudo apt-get update -qq
            sudo apt-get install -y docker-ce docker-ce-cli containerd.io

            sudo groupadd docker
            sudo usermod -aG docker "$USER"
            break;;
        No ) break;;
    esac
done


tput setaf 2; echo "Do you want to install docker-compose"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo curl \
                -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-Linux-x86_64" \
                -o /usr/local/bin/docker-compose

            sudo chmod +x /usr/local/bin/docker-compose
            break;;
        No ) break;;
    esac
done

tput setaf 2; echo "Do you want to install node.js and tools"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo apt install -y nodejs npm
            sudo npm install n -g
            sudo n stable
            sudo apt purge -y nodejs npm
            break;;
        No ) break;;
    esac
done