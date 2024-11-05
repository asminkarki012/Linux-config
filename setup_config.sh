#!/bin/bash

# Variables
REPO_URL="https://github.com/asminkarki012/Linux-config.git"
NVIM_DIR="$HOME/.config"
REPO_DIR="$HOME/Linux-config"
TMUX_DIR="$HOME/.tmux"

# Setup neovim and tmux configuration
#
# This function clones the neovim and tmux configuration from the given github
# repository, and copies the neovim config to ~/.config/nvim and the tmux config
# to ~/.tmux.conf, overwriting any existing configuration.

setup_linux_config() {
    if [ -d "$REPO_DIR/.git" ]; then
        echo "Updating existing repository..."
        cd "$REPO_DIR" && git pull origin main
    else
        echo "Cloning repository..."
        git clone "$REPO_URL" "$REPO_DIR"
    fi
}

setup_neovim_config() {
    echo "Setting up Neovim configuration..."
    cp -rf "$REPO_DIR/nvim" "$NVIM_DIR"
}

setup_tmux_config() {
    if [ ! -d "$TMUX_DIR" ]; then
        mkdir -p "$TMUX_DIR" || {
            echo "Error: Could not create $TMUX_DIR" >&2
            return 1
        }
    fi
    cp -f "$REPO_DIR/.tmux.conf" "$TMUX_DIR" || {
        echo "Error: Could not copy .tmux.conf to $TMUX_DIR" >&2
        return 1
    }

    local tmux_plugin_dir="$TMUX_DIR/plugins/tpm"
    if [ ! -d "$tmux_plugin_dir" ]; then
        git clone "https://github.com/tmux-plugins/tpm" "$tmux_plugin_dir" || {
            echo "Error: Could not clone tpm repository" >&2
            return 1
        }
    else
        echo "plugins tpm already exists"
    fi

    #execute tmux
    echo "Executing tmux conf"
    tmux source "$TMUX_DIR/.tmux.conf"

}
# Main function
main() {
    setup_linux_config
    setup_neovim_config
    setup_tmux_config
    echo "nvim and tmux configuration setup complete."
}

main
