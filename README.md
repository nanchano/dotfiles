To create a link (use absolute paths): `ln -sf $source $target`

1. alacritty -> ~/.config/alacritty/
3. .bashrc -> ~/.bashrc
4. .tmux.conf -> ~/.tmux.conf

For tmux first time setup, download the plugin manager and install the plugins:
1. Download: `git clone https://github.com/tmux-plugins/tpm ~/.config/.tmux/plugins/tpm`
2. `tmux source-file .tmux.conf`
3. Install: `prefix + I`

config libsecret:
git config --global credential.helper /usr/lib/git-core/git-credential-libsecret
