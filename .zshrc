export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export EDITOR="nvim"
export VISUAL="nvim"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# Python
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi

# Rust
#. "$HOME/.cargo/env"

# Zsh Git Prompt (using vcs_info)
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
export PS1='[%n | %1~${vcs_info_msg_0_}]$ '

# Load aliases
if [ -f "$HOME/.zsh_aliases" ]; then
    . "$HOME/.zsh_aliases"
fi

# Load local/private configuration
if [ -f "$HOME/.zshrc.local" ]; then
    . "$HOME/.zshrc.local"
fi
