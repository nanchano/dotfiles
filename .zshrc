export PATH="$HOME/.local/bin:$PATH"

# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# Python
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi

# Poetry

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"

# Rust
. "$HOME/.cargo/env"

# MySQL
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Node Version Manager (lazy-loaded)
export NVM_DIR="$HOME/.nvm"
nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}


# Lazy-load node and npm commands too
node() {
    unset -f node
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    node "$@"
}

npm() {
    unset -f npm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npm "$@"
}

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nicolasanchano/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nicolasanchano/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nicolasanchano/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nicolasanchano/google-cloud-sdk/completion.zsh.inc'; fi

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

# Load local/private configuration (credentials, custom functions, etc.)
if [ -f "$HOME/.zshrc.local" ]; then
    . "$HOME/.zshrc.local"
fi
