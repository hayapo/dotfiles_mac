#/bin/sh

tput setaf 2; echo "Do you want to install Python Tools"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev
            sudo apt-get install -y libreadline-dev libsqlite3-dev wget curl llvm
            sudo apt-get install -y libncurses5-dev libncursesw5-dev xz-utils tk-dev
            sudo apt-get install -y libffi-dev liblzma-dev python-openssl python-dev software-properties-common

            git clone https://github.com/pyenv/pyenv.git ~/.pyenv
            git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
            git clone https://github.com/pyenv/pyenv-update.git ~/.pyenv/plugins/pyenv-update
            git clone https://github.com/pyenv/pyenv-pip-rehash.git ~/.pyenv/plugins/pyenv-pip-rehash

            export PATH="$HOME/.pyenv/bin:$PATH"
            eval "$(pyenv init -)"

            pyenv install 3.9.4

            sudo apt-get install -y python3-pip

            break;;
        No ) break;;
    esac
done

tput setaf 2; echo "Do you want to install rust and rustup.rs"; tput sgr0
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
            export PATH="$HOME/.cargo/bin:$PATH"
            sudo rustup completions bash | sudo tee -a /etc/bash_completion.d/rustup.bash-completion

            rustup install nightly

            cargo install starship
            ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
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