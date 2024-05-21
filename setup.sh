#!/usr/bin/env bash

set -eu

# Check nvim config exists

if [[ -d $HOME/.config/nvim ]]; then
  echo -e "Backup old config"
  mv $HOME/.config/nvim $HOME/.config/nvim-back
fi

if [[ -d $HOME/.local/share/nvim ]]; then
  echo -e "Backup old nvim data"
  mv $HOME/.local/share/nvim $HOME/.local/share/nvim-back
fi

echo -e "Create symbolic link"

ln -s "$PWD/ftplugin" "$PWD/nvchad/ftplugin"
ln -s "$PWD/lua/custom" "$PWD/nvchad/lua/custom"
ln -s "$PWD/nvchad" "$HOME/.config/nvim"

