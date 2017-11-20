#!/bin/bash

# Remove old aliases and point them towards the new themes
themes_location=$HOME/dotfiles/themes
rm -f $themes_location/main_colors.sh
rm -f $themes_location/tmux_colors.conf
rm -f $themes_location/current_theme
rm -f $themes_location/iterm_tob_bar_color.sh

cp $themes_location/$1/main_colors.sh $themes_location/main_colors.sh
cp $themes_location/$1/tmux_colors.conf $themes_location/tmux_colors.conf
cp $themes_location/$1/name_art $themes_location/current_theme
cp $themes_location/$1/iterm_top_bar_color.sh $themes_location/current_iterm_top_color.sh

clear
$themes_location/current_iterm_top_color.sh
#cat $themes_location/current_theme
