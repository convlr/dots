#!/usr/bin/env bash

DOTS=( "$HOME"/dots/* )

for i in "${DOTS[@]}"; do
  case "$i" in

    */bash)
      ln -sf "$i/.bashrc" "$HOME/.bashrc"
      echo "bashrc linked"
      ;;

    */nvim)
      mkdir -p "$HOME/.config/nvim"
      ln -sf "$i/init.lua" "$HOME/.config/nvim/init.lua"
      echo "nvim linked"
      ;;

    */alacritty)
      ln -sf "$i/.alacritty.toml" "$HOME/.alacritty.toml"
      echo "alacritty linked"
      ;;

    esac
done
