#!/usr/bin/env bash

# {{{ interactive check

if [[ $- != *i* ]]; then return; fi

# }}}
# {{{ bash options

shopt -s autocd

# }}}
# {{{ resolve home and load/init xf-bash-lib

RESOLVED_USER="$(whoami)"
RESOLVED_HOSTNAME="$(hostname)"

if [[ ! -v HOME ]]; then
  RESOLVED_HOME="$(userdbctl user "$RESOLVED_USER" | grep Directory | sed 's/.*: \(.*\)/\1/')"
  export HOME=$RESOLVED_HOME
fi

export SHELL=bash
export TERM=xterm-256color
export USER="$RESOLVED_USER"
export HOSTNAME="$RESOLVED_HOSTNAME"
export NVM_PATH="$HOME/.nvm"
export XF_BASH_LIB_PATH="$HOME/.xf-bash-lib"

# shellcheck disable=1090
source "$XF_BASH_LIB_PATH/xf_bash_lib.sh"

# }}}
# {{{ remaining env setup w/ xf-lib

RESOLVED_EDITOR="$(xf_resolve_editor)"
RESOLVED_HOME_SRC_DIR="$(xf_ensure_home_subdir '.src')"

export EDITOR="$RESOLVED_EDITOR"
export HOME_SRC_DIR="$RESOLVED_HOME_SRC_DIR"

HOME_BIN_DIR="$(xf_ensure_home_subdir 'bin')"
HOME_DOTFILES_BIN_DIR="$(xf_ensure_home_subdir '.bin')"
HOME_LOCAL_BIN_DIR="$(xf_ensure_home_subdir '.local/bin')"

xf_safe_add_dir_to_path "$HOME_BIN_DIR"
xf_safe_add_dir_to_path "$HOME_DOTFILES_BIN_DIR"
xf_safe_add_dir_to_path "$HOME_LOCAL_BIN_DIR"

# }}}
# {{{ system

shutdn() {
  shutdown -h -P now
}

kk() {
  sudo killall "$1" -9
}

mnt() {
  sudo mount "/dev/$1" /mnt
}

umnt() {
  sudo unmount /mnt
}

# }}}
# {{{ shell

x() {
  exit
}

c() {
  clear
}

# }}}
# {{{ system services

jctl() {
  sudo journalctl -u "$@"
}

jctlf() {
  sudo journalctl -u "$@" -f
}

sysup() {
  sudo systemctl start "$@"
}

sysdn() {
  sudo systemctl stop "$@"
}

sysst() {
  sudo systemctl status "$@"
}

syson() {
  sudo systemctl enable "$@"
}

sysoff() {
  sudo systemctl disable "$@"
}

# }}}
# {{{ system packages
# TODO: Refactor, copy/paste for now pending utility funcs

if [[ -z $(xf_has_cmd 'dnf') ]]; then
  PKG_INSTALL_CMD='sudo dnf install -y'
  PKG_UPDATE_CMD='sudo dnf update -y'
  PKG_SEARCH_CMD='dnf search'
  PKG_REMOVE_CMD='sudo dnf remove -y'
elif [[ -z $(xf_has_cmd 'pacman') ]]; then
  PKG_INSTALL_CMD='sudo pacman -S'
  PKG_UPDATE_CMD='sudo pacman -Syyuu'
  PKG_SEARCH_CMD='sudo pacman -Q'
  PKG_REMOVE_CMD='sudo pacman -R'
elif [[ -z $(xf_has_cmd 'apt') ]]; then
  PKG_INSTALL_CMD='sudo apt install'
  PKG_UPDATE_CMD='sudo apt update && apt upgrade'
  PKG_SEARCH_CMD='apt search'
  PKG_REMOVE_CMD='sudo apt remove'
elif [[ -z $(xf_has_cmd 'pkg') ]]; then
  PKG_INSTALL_CMD='pkg install -y'
  PKG_UPDATE_CMD='pkg update -y && pkg upgrade -y'
  PKG_SEARCH_CMD='pkg search'
  PKG_REMOVE_CMD='pkg remove -y'
else
  PKG_MGMT_DISABLED=1
fi

if [[ -n "$PKG_MGMT_DISABLED" ]]; then
  pkgi() {
    bash -c "$PKG_INSTALL_CMD $*"
  }

  pkgs() {
    bash -c "$PKG_SEARCH_CMD $*"
  }

  pkgu() {
    bash -c "$PKG_UPDATE_CMD $*"
  }

  pkgd() {
    bash -c "$PKG_REMOVE_CMD $*"
  }
fi

# }}}
# {{{ tmux

tmn() {
  # export ACTIVE_TMUX_SESSION_NAME=${$1:-T}

  tmux new -s T
}

tma() {
  # SESSIONS="$(tmux list-sessions -F '{#session_name}')"
  # SESSION_NAME_OR_INDEX="${$1:-0}"

  tmux attach -t T
}

# }}}
# {{{ utilities

man() {
  "$EDITOR" -c "Man $*" -c 'only'
}

# }}}
# {{{ aliases

alias grep='grep --color'
alias cat="bat"
alias vim="nvim -u ~/.vimrc"
alias nvim="nvim -u ~/.vimrc"
alias nvim-gtk="nvim-gtk -- -u ~/.vimrc"
alias ls="ls --color=auto -h --group-directories-first"
alias ll="ls --color=auto -alh --group-directories-first"
alias lt="ls --color=auto -alht --group-directories-first"

# }}}
# {{{ plugins/autocomplete

BASH_POWERLINE_SH_PATH="$HOME/.bash-powerline.sh"

if [[ -f "$BASH_POWERLINE_SH_PATH" ]]; then
  export PROMPT_COMMAND='echo -n "$USER@$HOSTNAME > "'
  xf_safe_source "$BASH_POWERLINE_SH_PATH"
fi

xf_safe_source "$HOME/.autojump/share/autojump/autojump.bash"
xf_safe_source "$(xf_git_repo_path 'alacritty')/extra/completions/alacritty.bash"
xf_safe_source "$(xf_git_repo_path 'gjsheep' 'bash-wakatime')/bash-wakatime.sh"

# }}}
