# PYTHON

export PYENV_ROOT="$HOME/.pyenv"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
export PATH="$PYENV_ROOT/shims:$PATH"
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

if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nicolasanchano/google-cloud-sdk/path.bash.inc' ]; then . '/Users/nicolasanchano/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nicolasanchano/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/nicolasanchano/google-cloud-sdk/completion.bash.inc'; fi

# BI AIRFLOW BUCKET to make development easier
export AIRFLOW_BUCKET="us-central1-bi-airflow-ef25f924-bucket"

# GOOGLE_APPLICATION_CREDENTIALS path to JSON file for docker authentication on GCP servs
export GCP_KEY_PATH=~/.config/gcloud/application_default_credentials.json
export DOCKER_GCS_WRITER_KEY_PATH=~/credentials/service_accounts/docker_gcs_writer_service_account.json
. "$HOME/.cargo/env"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

export BASH_SILENCE_DEPRECATION_WARNING=1

alias tf="terraform"
alias k="kubectl"
