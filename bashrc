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
RESOLVED_EDITOR="$(xf_resolve_editor)"
RESOLVED_HOME_SRC_DIR="$(xf_ensure_home_subdir '.src')"

if [[ ! -v HOME ]]; then
  RESOLVED_HOME="$(userdbctl user "$RESOLVED_USER" | grep Directory | sed 's/.*: \(.*\)/\1/')"
  export HOME=$RESOLVED_HOME
fi

export SHELL=bash
export TERM=xterm-256color
export USER="$RESOLVED_USER"
export EDITOR="$RESOLVED_EDITOR"
export HOSTNAME="$RESOLVED_HOSTNAME"
export HOME_SRC_DIR="$RESOLVED_HOME_SRC_DIR"
export XF_BASH_LIB_PATH="$HOME/.xf-bash-lib"
export USER_LOCAL_BIN_DIR='/usr/local/bin'
export NVM_PATH="$HOME/.nvm"

# shellcheck disable=1090
source "$XF_BASH_LIB_PATH/xf_bash_lib.sh"

# }}}
# {{{ remaining env setup w/ xf-lib

HOME_LOCAL_BIN_DIR="$(xf_ensure_home_subdir '.local/bin')"
HOME_HIDDEN_BIN_DIR="$(xf_ensure_home_subdir '.bin')"

# TODO: Remove, moved to ~/.bin
HOME_BIN_DIR="$(xf_ensure_home_subdir 'bin')"

xf_safe_add_dir_to_path "$USER_LOCAL_BIN_DIR"
xf_safe_add_dir_to_path "$HOME_BIN_DIR"
xf_safe_add_dir_to_path "$HOME_LOCAL_BIN_DIR"
xf_safe_add_dir_to_path "$HOME_HIDDEN_BIN_DIR"

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
# todo: refactor, copy/paste for now pending utility funcs

if [[ -z $(xf_has_cmd 'dnf') ]]; then
  pkg_install_cmd='sudo dnf install -y'
  pkg_update_cmd='sudo dnf update -y'
  pkg_search_cmd='dnf search'
  pkg_remove_cmd='sudo dnf remove -y'
elif [[ -z $(xf_has_cmd 'pacman') ]]; then
  pkg_install_cmd='sudo pacman -s'
  pkg_update_cmd='sudo pacman -syyuu'
  pkg_search_cmd='sudo pacman -q'
  pkg_remove_cmd='sudo pacman -r'
elif [[ -z $(xf_has_cmd 'apt') ]]; then
  pkg_install_cmd='sudo apt install'
  pkg_update_cmd='sudo apt update && apt upgrade'
  pkg_search_cmd='apt search'
  pkg_remove_cmd='sudo apt remove'
elif [[ -z $(xf_has_cmd 'pkg') ]]; then
  pkg_install_cmd='pkg install -y'
  pkg_update_cmd='pkg update -y && pkg upgrade -y'
  pkg_search_cmd='pkg search'
  pkg_remove_cmd='pkg remove -y'
else
  pkg_mgmt_disabled=1
fi

if [[ ! $""pkg_mgmt_disabled -eq 1 ]]; then
  pkgi() {
    bash -c "$pkg_install_cmd $*"
  }

  pkgs() {
    bash -c "$pkg_search_cmd $*"
  }

  pkgu() {
    bash -c "$pkg_update_cmd $*"
  }

  pkgd() {
    bash -c "$pkg_remove_cmd $*"
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
alias nvim="nvim -u ~/.vimrc"
alias nvim-gtk="nvim-gtk -- -u ~/.vimrc"
alias ls="ls --color=auto -h --group-directories-first"
alias ll="ls --color=auto -alh --group-directories-first"
alias lt="ls --color=auto -alht --group-directories-first"
alias read="cat README.md"

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
