#!/usr/bin/env bash
#===============================================================================
# Name        : install-vim.sh
# Description : Install Vim 8 with Python3 support from source on Ubuntu
# Author      : Joshua Mabina
#===============================================================================

set -euo pipefail
IFS=$'\n\t'

SCRIPT_NAME=$(basename "$0")
LOG_FILE="/var/log/${SCRIPT_NAME%.sh}.log"
VERSION="1.2.0"

#---------------------------------------
# Colors
#---------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

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
  -i, --install      Install Vim from source (Python3 only)
  -h, --help         Show this help message
  -v, --version      Show script version

Example:
  sudo $SCRIPT_NAME --install
EOF
}

#---------------------------------------
# Vim Installation Functions
#---------------------------------------
remove_old_vim() {
    info "Removing old Vim packages..."
    apt remove -y vim vim-runtime vim-gtk3 vim-nox vim-tiny || true
    apt autoremove -y
    success "Old Vim packages removed."
}

install_dependencies() {
    info "Installing build dependencies..."
    apt update -y
    apt install -y git build-essential libncurses-dev \
        python3-dev libperl-dev ruby-dev lua5.3 liblua5.3-dev libacl1-dev libgpm-dev
    success "Dependencies installed."
}

clone_vim_source() {
    info "Cloning Vim source (shallow clone)..."
    rm -rf /tmp/vim-src
    git clone --depth=1 https://github.com/vim/vim.git /tmp/vim-src
    cd /tmp/vim-src || error "Failed to cd into Vim source."
}

build_and_install_vim() {
    info "Configuring Vim with Python 3 support..."
    ./configure --with-features=huge \
                --enable-multibyte \
                --enable-python3interp=yes \
                --with-python3-command=python3 \
                --enable-gui=gtk3 \
                --enable-cscope \
                --prefix=/usr/local

    info "Building Vim..."
    make -j"$(nproc)"

    info "Installing Vim..."
    make install
    success "Vim installed successfully!"
}

create_symlinks_and_aliases() {
  info "Linking 'vi' and 'vim' to the new build..."
  ln -sf /usr/local/bin/vim /usr/local/bin/vi

  # Optional: add shell aliases for extra safety
  for rcfile in "$HOME/.bashrc" "$HOME/.zshrc"; do
    if [[ -f "$rcfile" && -z "$(grep 'alias vi=' "$rcfile" || true)" ]]; then
      echo "alias vi='/usr/local/bin/vim'" >> "$rcfile"
      echo "alias vim='/usr/local/bin/vim'" >> "$rcfile"
      log "Added aliases to $rcfile"
    fi
  done

  success "Symlinks and aliases created. Both 'vim' and 'vi' now point to the same binary."
}

cleanup() {
    info "Cleaning up Vim source..."
    cd ~
    rm -rf /tmp/vim-src
    success "Cleanup done."
}

verify_vim() {
    info "Verifying Vim Python 3 support..."
    vim --version | grep python3
    success "Vim 8 with Python 3 support is ready!"
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
            remove_old_vim
            install_dependencies
            clone_vim_source
            build_and_install_vim
            create_symlinks_and_aliases
            cleanup
            verify_vim
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

