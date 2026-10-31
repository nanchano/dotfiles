# dotfiles

Set up a new machine:

```sh
git clone git@github.com:nanchano/dotfiles ~/dotfiles
~/dotfiles/setup.sh
```

The script links each config file into `$HOME`.
It moves an existing file to `~/.dotfiles_backup/` first.
It also installs the tmux plugin manager (tpm) and the tmux plugins.

Install these tools with your package manager: `zsh`, `tmux`, `eza`, `nvim`, Alacritty
and the Hack Nerd Font.

Never commit secrets or machine-specific settings to this repo.
Keep them in untracked files, such as `*.local` files.

## Some useful gitconfig snippets

```
[alias]
	st = status
	ci = commit
	co = checkout
	br = branch
	unstage = reset HEAD --
	last = log -1 HEAD
	brd = ! git branch -D `git branch | grep -v '^*\\|main\\|master\\|staging\\|develop'`
[push]
	autoSetupRemote = true
[init]
	defaultBranch = main
```
