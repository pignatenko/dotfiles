#!/usr/bin/env bash

CWD=$(pwd)

mkdir -p "$HOME/.config"
ln -s $CWD/nvim "$HOME/.config/nvim"
ln -s $CWD/zsh "$HOME/.zsh"
ln -s $CWD/zsh/zshrc "$HOME/.zsh/.zshrc"
ln -s $CWD/zsh/zshenv "$HOME/.zshenv"
