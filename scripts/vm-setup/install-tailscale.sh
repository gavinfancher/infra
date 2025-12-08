#!/usr/bin/env bash

curl -fsSL https://tailscale.com/install.sh | sh

sudo tailscale set --operator="$USER"

read -p "enter host nickname: " TS_HOSTNAME

read -p "enter linux setup key: " TS_KEY

sudo tailscale up \
  --authkey="$TS_KEY" \
  --hostname="$TS_HOSTNAME" \

sudo tailscale set --auto-update=true

echo "tailscale is up authenticated and your configuration is set"