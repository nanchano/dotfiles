#!/usr/bin/env zsh

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

print_success() {
    echo "${GREEN}✓${NC} $1"
}

print_warning() {
    echo "${YELLOW}⚠${NC}  $1"
}

print_info() {
    echo "${BLUE}→${NC} $1"
}

print_error() {
    echo "${RED}✗${NC} $1"
}

# Detect OS
detect_os() {
    case "$(uname -s)" in
        Darwin*)
            echo "macos"
            ;;
        Linux*)
            if [ -f /etc/arch-release ]; then
                echo "arch"
            else
                echo "linux"
            fi
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

OS="$(detect_os)"

# Get appropriate package manager
get_package_manager() {
    case "$OS" in
        macos)
            echo "brew"
            ;;
        arch)
            if command -v paru >/dev/null 2>&1; then
                echo "paru"
            else
                echo "pacman"
            fi
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

PKG_MANAGER="$(get_package_manager)"

# Generate install command for a package
install_command() {
    local package="$1"
    local package_alt="$2"  # Alternative package name for Linux

    case "$PKG_MANAGER" in
        brew)
            echo "brew install $package"
            ;;
        paru)
            echo "paru -S ${package_alt:-$package}"
            ;;
        pacman)
            echo "sudo pacman -S ${package_alt:-$package}"
            ;;
        *)
            echo "install $package"
            ;;
    esac
}

echo "${BLUE}==================================${NC}"
echo "${BLUE}  Dotfiles Setup Script${NC}"
echo "${BLUE}==================================${NC}\n"

print_info "Detected OS: $OS"
print_info "Package manager: $PKG_MANAGER"
echo ""

echo "${BLUE}Checking prerequisites...${NC}\n"

if [ "$OS" = "macos" ]; then
    if command_exists brew; then
        print_success "Homebrew found"
    else
        print_warning "Homebrew not found. Install from: https://brew.sh"
    fi
fi

if command_exists zsh; then
    print_success "Zsh found"
else
    print_error "Zsh not found. Please install zsh first."
    exit 1
fi

if command_exists tmux; then
    print_success "Tmux found"
else
    print_warning "Tmux not found. Install with: $(install_command tmux)"
fi

if command_exists pyenv; then
    print_success "pyenv found"
else
    print_warning "pyenv not found. Install with: $(install_command pyenv)"
fi

if command_exists go; then
    print_success "Go found"
else
    print_warning "Go not found. Install with: $(install_command go golang)"
fi

if [ -f "$HOME/.cargo/env" ]; then
    print_success "Rust/Cargo found"
else
    print_warning "Rust not found. Install from: https://rustup.rs"
fi

if command_exists eza; then
    print_success "eza found"
else
    print_warning "eza not found. Install with: $(install_command eza)"
fi

if command_exists nvim; then
    print_success "nvim found"
else
    print_warning "nvim not found. Install with: $(install_command neovim)"
fi

if command_exists kubectl; then
    print_success "kubectl found"
else
    print_warning "kubectl not found. Install with: $(install_command kubectl)"
fi

if command_exists terraform; then
    print_success "terraform found"
else
    print_warning "terraform not found. Install with: $(install_command terraform)"
fi

# Check for Hack Nerd Font
if fc-list 2>/dev/null | grep -qi "Hack Nerd Font"; then
    print_success "Hack Nerd Font found"
else
    if [ "$PKG_MANAGER" = "brew" ]; then
        print_warning "Hack Nerd Font not found. Install with: brew install --cask font-hack-nerd-font"
    else
        print_warning "Hack Nerd Font not found. Install with: $(install_command ttf-hack-nerd)"
    fi
fi

echo ""

echo "${BLUE}Creating necessary directories...${NC}"
mkdir -p "$HOME/.config"
print_success "Created ~/.config directory"

TPM_DIR="$HOME/.config/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    print_info "Installing Tmux Plugin Manager (tpm)..."
    mkdir -p "$HOME/.config/.tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR" >/dev/null 2>&1
    print_success "Installed tpm to $TPM_DIR"
else
    print_success "tpm already installed"
fi

echo ""

echo "${BLUE}Creating symlinks...${NC}"

ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
print_success "Linked .zshrc"

ln -sf "$DOTFILES_DIR/.zsh_aliases" "$HOME/.zsh_aliases"
print_success "Linked .zsh_aliases"

ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
print_success "Linked .tmux.conf"

# Remove existing alacritty directory/symlink to prevent nested directory issue
rm -rf "$HOME/.config/alacritty"
ln -sf "$DOTFILES_DIR/alacritty" "$HOME/.config/alacritty"
print_success "Linked alacritty configuration"

echo ""

echo "${GREEN}==================================${NC}"
echo "${GREEN}  Setup Complete!${NC}"
echo "${GREEN}==================================${NC}\n"

echo "${BLUE}Next steps:${NC}"
echo "1. Restart your terminal or run: ${YELLOW}source ~/.zshrc${NC}"
echo "2. Open tmux and install plugins: ${YELLOW}prefix + I${NC} (prefix is Ctrl+a)"
echo "3. Install any missing dependencies shown in warnings above"
echo ""
echo "Your dotfiles are now set up and ready to use!"
