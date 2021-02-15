#!/bin/bash

PORT=9999
KEY_FN="$HOME/.ssh/id_rsa_termux"
IP=$(./get_termux_sshd_ip.sh)
USERNAME=$(./get_termux_username.sh)
SSH_PASSWORD=$(pass ssh/termux)

SSHPASS="$SSH_PASSWORD" sshpass -Ppassphrase -e ssh "$USERNAME"@"$IP" -p "$PORT" -i "$KEY_FN"
