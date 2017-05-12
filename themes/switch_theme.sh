#!/bin/bash

# Remove old aliases and point them towards the new themes
themes_location=$HOME/dotfiles/themes
rm -f $themes_location/main_colors.sh
rm -f $themes_location/tmux_colors.conf

cp $themes_location/$1/main_colors.sh $themes_location/main_colors.sh
cp $themes_location/$1/tmux_colors.conf $themes_location/tmux_colors.conf

clear
echo Theme set to $1

