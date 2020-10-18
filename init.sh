#!/usr/bin/env bash

mkdir -p "$HOME/.config"
ln -s nvim "$HOME/.config/nvim"
ln -s zsh "$HOME/.zsh"
ln -s zsh/zshrc "$HOME/.zsh/.zshrc"
ln -s zsh/zshenv "$HOME/.zshenv"
