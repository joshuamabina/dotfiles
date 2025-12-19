#!/usr/bin/env bash
#===============================================================================
# Name        : install-docker.sh
# Description : Install and configure Docker & Docker Compose on Ubuntu
# Author      : Joshua Mabina
# Email       : mabinajoshua@gmail.com
#===============================================================================

set -euo pipefail
IFS=$'\n\t'

#---------------------------------------
# Configuration
#---------------------------------------
SCRIPT_NAME=$(basename "$0")
LOG_FILE="/var/log/${SCRIPT_NAME%.sh}.log"
VERSION="1.0.0"

DOCKER_COMPOSE_VERSION="v2.27.0" # Update as needed

#---------------------------------------
# Colors
#---------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

#---------------------------------------
# Utility Functions
#---------------------------------------
log()     { echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"; }
info()    { echo -e "${BLUE}[INFO]${NC} $*"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $*"; }
error()   { echo -e "${RED}[ERROR]${NC} $*" >&2; exit 1; }
success() { echo -e "${GREEN}[OK]${NC} $*"; }

require_root() {
    if [[ "$EUID" -ne 0 ]]; then
        error "Please run as root (sudo)."
    fi
}

usage() {
    cat <<EOF
Usage: $SCRIPT_NAME [OPTIONS]

Options:
  -i, --install      Install Docker & Docker Compose
  -c, --configure    Configure Docker user/group
  -u, --uninstall    Remove Docker & Docker Compose
  -h, --help         Show this help message
  -v, --version      Show script version

Examples:
  sudo $SCRIPT_NAME --install
  sudo $SCRIPT_NAME --configure
EOF
}

#---------------------------------------
# Core Functions
#---------------------------------------
install_app() {
    info "Updating package lists..."
    apt update -y

    info "Installing prerequisite packages..."
    apt install -y ca-certificates curl gnupg lsb-release

    info "Adding Docker’s official GPG key..."
    mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    info "Setting up the Docker repository..."
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

    info "Updating package lists..."
    apt update -y

    info "Installing Docker Engine, CLI, and containerd..."
    apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    info "Installing Docker Compose standalone binary..."
    curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" \
        -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose

    success "Docker and Docker Compose installation complete!"
}

configure_app() {
    info "Adding current user to docker group..."
    usermod -aG docker "$SUDO_USER"
    info "Enabling Docker service..."
    systemctl enable docker
    systemctl start docker
    success "Docker configuration complete. You may need to log out/in for group changes to take effect."
}

uninstall_app() {
    warn "Stopping Docker service..."
    systemctl stop docker || true

    warn "Removing Docker packages..."
    apt remove -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    rm -f /usr/local/bin/docker-compose

    warn "Removing Docker data directories..."
    rm -rf /var/lib/docker /var/lib/containerd

    success "Docker and Docker Compose uninstallation complete."
}

#---------------------------------------
# Argument Parsing
#---------------------------------------
if [[ $# -eq 0 ]]; then
    usage
    exit 1
fi

while [[ $# -gt 0 ]]; do
    case "$1" in
        -i|--install)
            require_root
            install_app
            ;;
        -c|--configure)
            require_root
            configure_app
            ;;
        -u|--uninstall)
            require_root
            uninstall_app
            ;;
        -h|--help)
            usage
            ;;
        -v|--version)
            echo "$SCRIPT_NAME version $VERSION"
            ;;
        *)
            error "Unknown option: $1"
            ;;
    esac
    shift
done
