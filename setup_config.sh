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

  echo "Setting up font..."

  if fc-list | grep -q "JetBrainsMono"; then
    echo "JetBrainsMono font is already installed, skipping font setup."
  else
    wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip &&
      cd ~/.local/share/fonts &&
      unzip JetBrainsMono.zip &&
      rm JetBrainsMono.zip &&
      fc-cache -fv
  fi

  echo "setting up lazygit..."

  if [ ! -f /usr/local/bin/lazygit ]; then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    #clean up files
    rm lazygit.tar.gz lazygit
  fi

}

setup_tmux_config() {
  if [ ! -d "$TMUX_DIR" ]; then
    mkdir -p "$TMUX_DIR" || {
      echo "Error: Could not create $TMUX_DIR" >&2
      return 1
    }
  fi

  cp -f "$REPO_DIR/.tmux.conf" "$HOME" || {
    echo "Error: Could not copy .tmux.conf to $HOME" >&2
    return 1
  }

  local tmux_plugin_dir="$TMUX_DIR/plugins/tpm"
  if [ ! -d "$tmux_plugin_dir" ]; then
    git clone "https://github.com/tmux-plugins/tpm" "$tmux_plugin_dir" || {
      echo "Error: Could not clone tpm repository" >&2
      return 1
    }
  fi

  #if ! grep -q 'alias tmux="tmux -f ~/.tmux/.tmux.conf"' ~/.bashrc; then
   # echo 'alias tmux="tmux -f ~/.tmux/.tmux.conf"' >>~/.bashrc
    #echo "Alias for tmux added to .bashrc"
  #fi

}
# Main function
main() {
  setup_linux_config
  setup_neovim_config
  setup_tmux_config
  echo "nvim and tmux configuration setup complete."
}

main
