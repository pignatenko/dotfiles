#!/usr/bin/env bash
CWD=$(pwd)

mkdir -p "$HOME/.config"


rm "$CWD/zsh/.zshrc"
rm "$CWD/zsh/.zshenv"
rm "$HOME/.config/nvim"
rm "$HOME/.zsh"
rm "$HOME/.config/kitty"
rm "$HOME/.tmux.conf"
rm "$HOME/.config/karabiner"

ln -s $CWD/nvim "$HOME/.config/nvim"
ln -s $CWD/zsh "$HOME/.zsh"
ln -s $CWD/zsh/zshrc "$HOME/.zsh/.zshrc"
ln -s $CWD/zsh/zshenv "$HOME/.zshenv"
ln -s $CWD/kitty "$HOME/.config/kitty"
ln -s $CWD/tmux/tmux.conf "$HOME/.tmux.conf"
ln -s $CWD/karabiner "$HOME/.config/karabiner"
