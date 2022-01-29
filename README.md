To create a link (use absolute paths): `ln -sf $source $target`

1. ~/dotfiles/alacritty/alacritty.yml -> ~/.config/alacritty/alacritty.yml
3. ~/dotfiles/.bashrc -> ~/.bashrc
4. ~/dotfiles/.tmux.conf -> ~/.tmux.conf

For tmux first time setup, download the plugin manager and install the plugins:
1. Download: `git clone https://github.com/tmux-plugins/tpm ~/.config/.tmux/plugins/tpm`
2. `tmux source-file .tmux.conf`
3. Install: `prefix + I`
