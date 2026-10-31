#!/bin/sh

set -eu

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
BACKUP="$HOME/.dotfiles_backup/$(date +%Y%m%d-%H%M%S)"

# link <path in repo> <target path>
link() {
    src="$DOTFILES/$1"
    dst="$2"
    if [ "$(readlink "$dst" 2>/dev/null || true)" = "$src" ]; then
        echo "ok      $dst"
        return
    fi
    mkdir -p "$(dirname "$dst")"
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        mkdir -p "$BACKUP"
        mv "$dst" "$BACKUP/$(basename "$dst")"
        echo "backup  $dst -> $BACKUP"
    fi
    ln -s "$src" "$dst"
    echo "linked  $dst"
}

link .zshrc          "$HOME/.zshrc"
link .zsh_aliases    "$HOME/.zsh_aliases"
link .tmux.conf      "$HOME/.tmux.conf"
link tmux/vague.conf "$HOME/.tmux/vague.conf"
link alacritty       "$HOME/.config/alacritty"

TPM="$HOME/.config/.tmux/plugins/tpm"
if [ ! -d "$TPM" ]; then
    git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM"
fi
if command -v tmux >/dev/null 2>&1; then
    "$TPM/bin/install_plugins" || echo "warning: tmux plugin install failed. Press prefix + I in tmux."
else
    echo "warning: tmux is not installed. Install it, then run this script again."
fi

echo "Done. Start a new shell to load the config."
