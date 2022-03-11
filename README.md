To create a link (use absolute paths): `ln -sf $source $target`

1. ~/dotfiles/alacritty/alacritty.yml -> ~/.config/alacritty/alacritty.yml
3. ~/dotfiles/.bashrc -> ~/.bashrc
4. ~/dotfiles/.tmux.conf -> ~/.tmux.conf

For tmux first time setup, download the plugin manager and install the plugins:
1. Download: `git clone https://github.com/tmux-plugins/tpm ~/.config/.tmux/plugins/tpm`
2. `tmux source-file .tmux.conf`
3. Install: `prefix + I`

For spectrwm:
1. Don't install from pacman - It's outdated, missing some config options on windows and screen.
2. Install from AUR - spectrwm-git.
3. Install JetBrains Mono Nerd Font for the arrows on the bar.
