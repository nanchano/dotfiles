if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi

export BASH_SILENCE_DEPRECATION_WARNING=1

# PYTHON
export PYENV_ROOT="$HOME/.pyenv"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
export PATH="$PYENV_ROOT/shims:$PATH"
export CLOUDSDK_PYTHON=/Users/nicolasanchano/.pyenv/shims/python
eval "$(pyenv init -)"

## poetry
export PATH="$HOME/.local/bin:$PATH"

## avoid pipenv LANG warning:
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# GO
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nicolasanchano/google-cloud-sdk/path.bash.inc' ]; then . '/Users/nicolasanchano/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nicolasanchano/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/nicolasanchano/google-cloud-sdk/completion.bash.inc'; fi

# RUST
. "$HOME/.cargo/env"

# MYSQL
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# Git branch on prompt
source ~/.git-prompt.sh
export PS1='[\u | \W$(__git_ps1 " (%s)")]\$ '

# Aliases
alias tf="terraform"
alias tg="terragrunt"
alias k="kubectl"
alias vi="nvim --"
alias ls="eza -al --color=always --group-directories-first"
eval "$(/opt/homebrew/bin/brew shellenv)"
