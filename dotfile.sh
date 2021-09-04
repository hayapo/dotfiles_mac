#!/bin/sh

BIN_NAME="$(basename "$0")"
COMMAND_NAME=$1


sub_help () {
    echo "Usage: $BIN_NAME <command>\n"
    echo "Commands:"
    echo "   help               This help message"
    echo "   reload             Reload dotfiles"
    echo "   system             Install basic setup for Ubuntu"
    echo "   pro                Install diffrent programmuing env"
    echo "   shell              Install, source and link dotfiles to bash and zhs"
    echo "   sublime            Install  Sublime Text 3 and custom plugins"
    echo "   atom               Install  Atom text editor"
    echo "   emacs              Install  Emacs and spacemac "
    echo "   vim                Install  Vim and custom plugins using Vundle"
    echo "   vscode             Install  VSCode"
    echo "   all                Install  using all options"
}

sub_reload () {
    source "/home/$USER/.bashrc" && echo "Bash reloaded."
}

sub_system () {
    sudo chmod +x install/system-install.sh
    bash install/system-install.sh
}

sub_pro () {
    sudo chmod +x install/pro-install.sh
    bash install/proglang-install.sh
}

sub_shell () {
    sudo chmod +x install/shell-install.sh
    bash install/shell-install.sh
}


sub_vscode () {
    sudo chmod +x install/vscode-install.sh
    bash install/vscode-install.sh
}



case $COMMAND_NAME in
    "" | "-h" | "--help")
        sub_help
        ;;
    *)
        shift
        "sub_${COMMAND_NAME}" "$@"
        if [ $? = 127 ]; then
            echo "'$COMMAND_NAME' is not a known command or has errors." >&2
            sub_help
            exit 1
        fi
        ;;
esac