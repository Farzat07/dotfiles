#!/usr/bin/env sh

# Set XDG_CONFIG_HOME.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

# set PATH so it includes user's private bin if it exists.
[ -d "$HOME/.local/bin" ] && PATH="$(find -H "$HOME/.local/bin" -maxdepth 1 -type d -printf %p:)$PATH"
[ -d "$HOME/bin" ] && PATH="$(find -H "$HOME/bin" -maxdepth 1 -type d -printf %p:)$PATH"

# Declare that this is my machine with all configs
export AFARZATMACHINE=FULL

# Read zshrc from there.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Some default programs.
export VISIUAL="nvim"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export PDFVIEWER="zathura"
export BROWSER="linkhandler"
export TERMINAL="st"

# Check whether this is an ssh session.
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export SESSION_TYPE=remote/ssh
# many other tests omitted
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) export SESSION_TYPE=remote/ssh;;
  esac
fi


# Some environment variable settings for some programs.

export MAILDIR="$XDG_DATA_HOME/mail"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
# Ledger
export LEDGER_FILE="$XDG_DATA_HOME/ledger/main.ledger"
# Pipenv.
export PIPENV_VENV_IN_PROJECT=1
# Go.
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin/go"
# Node.
export NVM_DIR="${XDG_DATA_HOME}/nvm"
# GnuPG.
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
# Pass.
export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/password-store"
# Gnu Info.
# export INFOPATH="$XDG_DATA_HOME/info:$INFOPATH"
