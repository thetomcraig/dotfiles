#!/bin/bash

runSegment() {
  python ~/Dotfiles/tmux/segments/weather.py > ~/Dotfiles/tmux/segments/weather_out.txt
  echo -n "$(cat weather_out.txt | perl -pe 's/\x1b\[[0-9;]*[mG]//g')"
}
