##!/bin/bash

#prompt() {
#  local ANSWER=''
#  local -r REQ=$1
#  local -r RES_LEN={2:-1}

#  if [[ -z $REQ ]]; then
#    echo 'Prompt string required'
#    exit 1
#  fi

#  read -n $RES_LEN -p "$REQ " ANSWER

#  echo $ANSWER
#}

#DEFAULT_SPEED=100
#DEFAULT_SENSITIVITY=100

#XINPUT_TP_LINE="$(xinput --list | grep TrackPoint)"

#if [[ -z $XINPUT_TP_LINE ]]; then
#  echo 'No TrackPoint found (see xinput --list)'
#  exit 1
#fi

#TP_CTRL_DIR="$( \
#  find /sys/devices/platform/i8042 -name name | \
#  xargs grep -Fl TrackPoint | \
#  sed 's/\/input\/input[0-9]*\/name$//' \
#)"

#if [[ -z $TP_CTRL_DIR ]]; then
#  echo 'Failed to find TrackPoint device in /sys'
#  exit 1
#fi

#TP_CTRL_SPEED=$TP_CTRL_DIR/speed
#TP_CTRL_SENSITIVITY=$TP_CTRL_DIR/sensitivity
#TP_CURRENT_SPEED="$(cat $TP_CTRL_SPEED)"
#TP_CURRENT_SENSITIVITY="$(cat $TP_CTRL_SENSITIVITY)"

#echo "Current speed: $TP_CURRENT_SPEED"
#echo "Current sensitivity: $TP_CURRENT_SENSITIVITY"

#INPUT_RESET=$(
#  prompt "Reset defaults? (speed $DEFAULT_SPEED) (sensitivity $DEFAULT_SENSITIVITY) (y/n)"
#)

#echo $INPUT_RESET

echo 100 | sudo tee /sys/devices/platform/i8042/serio1/serio2/speed
echo 100 | sudo tee /sys/devices/platform/i8042/serio1/serio2/sensitivity
