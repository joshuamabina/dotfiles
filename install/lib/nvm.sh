#!/usr/bin/env bash

set -e  # Exit immediately if a command exits with a non-zero status

# Function to print messages
info() {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

# 1. Install NVM
info "Installing NVM..."
if [ -d "$HOME/.nvm" ]; then
  info "NVM already installed."
else
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.6/install.sh | bash
fi

# Load NVM into current shell session
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1090
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 2. Install latest Node.js (includes npm)
info "Installing latest Node.js..."
nvm install node

# 3. Set default Node.js version
info "Setting default Node.js version..."
nvm alias default node

# 4. Verify installations
info "Verifying installations..."
node_version=$(node -v)
npm_version=$(npm -v)

echo "✅ Node.js version: $node_version"
echo "✅ npm version: $npm_version"
echo "✅ NVM installed at: $NVM_DIR"

info "Installation complete!"
