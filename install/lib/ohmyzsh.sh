#!/bin/bash

install_packages() {
  sudo apt-get update
  sudo apt-get install -y zsh git curl
}

check_command() {
  if ! command -v "$1" &> /dev/null; then
    echo "$1 could not be installed. Exiting."
    exit 1
  fi
}

install_ohmyzsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    echo "Oh My Zsh is already installed."
  fi
}

create_zshrc() {
  if [ ! -f "$HOME/.zshrc" ]; then
    echo "Creating .zshrc..."
    cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
  fi
}

update_zshrc() {
  local zshrc="$HOME/.zshrc"

  # Remove existing plugins section and theme settings
  sed -i '/^plugins=(.*)$/d' "$zshrc"
  sed -i '/^ZSH_THEME=/d' "$zshrc"
  sed -i '/^# ZSH_THEME_RANDOM_CANDIDATES=(.*)$/d' "$zshrc"
  sed -i '/^#/d' "$zshrc"
  sed -i '/^$/d' "$zshrc"  # Remove any empty lines

  # Add necessary settings and plugins
  {
    echo ''
    echo 'CASE_SENSITIVE="true"'
    echo 'HYPHEN_INSENSITIVE="true"'
    echo 'ENABLE_CORRECTION="true"'
    echo 'COMPLETION_WAITING_DOTS="true"'
    echo ''
    echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)'
    echo ''
    echo 'ZSH_THEME="kolo"'
    echo ''
  } >> "$zshrc"
}

update_zshrc_complete() {
  local zshrc="$HOME/.zshrc"

  # Copy complete zshrc configuration
  ln -sf ../_zshrc "$zshrc"
}

install_plugin() {
  local plugin_repo=$1
  local plugin_name=$(basename "$plugin_repo" .git)
  if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/$plugin_name" ]; then
    echo "Installing $plugin_name..."
    git clone "$plugin_repo" "$HOME/.oh-my-zsh/custom/plugins/$plugin_name"
  fi
}

change_default_shell() {
  if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing default shell to zsh..."
    chsh -s "$(which zsh)"
  fi
}

main() {
  install_packages
  check_command zsh
  install_ohmyzsh
  create_zshrc

  echo "Choose .zshrc configuration:"
  echo "1) Basic"
  echo "2) Complete"
  read -p "Enter choice [1 or 2]: " choice

  case $choice in
    1)
      update_zshrc
      ;;
    2)
      update_zshrc_complete
      ;;
    *)
      echo "Invalid choice. Exiting."
      exit 1
      ;;
  esac

  install_plugin https://github.com/zsh-users/zsh-autosuggestions.git
  install_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git

  change_default_shell

  echo "Oh My Zsh setup complete. Run 'source ~/.zshrc' to apply the changes."
}

main
