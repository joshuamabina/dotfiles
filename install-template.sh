#!/usr/bin/env bash
#===============================================================================
# Name        : install-template.sh
# Description : Template for Ubuntu install/config scripts with best practices.
# Author      : Joshua Mabina
#===============================================================================

set -euo pipefail
IFS=$'\n\t'

#---------------------------------------
# Configuration
#---------------------------------------
SCRIPT_NAME=$(basename "$0")
LOG_FILE="/var/log/${SCRIPT_NAME%.sh}.log"
VERSION="1.0.0"

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
log()    { echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"; }
info()   { echo -e "${BLUE}[INFO]${NC} $*"; }
warn()   { echo -e "${YELLOW}[WARN]${NC} $*"; }
error()  { echo -e "${RED}[ERROR]${NC} $*" >&2; exit 1; }
success(){ echo -e "${GREEN}[OK]${NC} $*"; }

require_root() {
    if [[ "$EUID" -ne 0 ]]; then
        error "Please run as root (sudo)."
    fi
}

usage() {
    cat <<EOF
Usage: $SCRIPT_NAME [OPTIONS]

Options:
  -i, --install      Run installation steps
  -c, --configure    Run configuration steps
  -u, --uninstall    Remove installed components
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

    info "Installing example packages..."
    apt install -y curl git vim

    success "Installation complete!"
}

configure_app() {
    info "Configuring application..."
    # Add config logic here
    success "Configuration done."
}

uninstall_app() {
    warn "Uninstalling example packages..."
    apt remove -y curl git vim
    success "Uninstallation complete."
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

