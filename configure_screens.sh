#!/bin/zsh 

num_displays=$(displayplacer list | grep "Persistent screen id" | wc -l | awk '{print $1}')

if [ "${num_displays}" = "4" ]; then
  # Dell 27
  /usr/local/bin/desktoppr 0 "/Users/tomcraig/Dropbox/TomCraig/07 Pictures/Wallpapers/wave_2.jpg"
  # Internal
  /usr/local/bin/desktoppr 1 "/Users/tomcraig/Dropbox/TomCraig/07 Pictures/Wallpapers/wave_1_no_notch.png"
  # Dell 25
  /usr/local/bin/desktoppr 2 "/Users/tomcraig/Dropbox/TomCraig/07 Pictures/Wallpapers/wave_3.jpeg"
  # Kogoda
  /usr/local/bin/desktoppr 3 "/Users/tomcraig/Dropbox/TomCraig/07 Pictures/Wallpapers/wave_4.jpeg"
  # Orientation
  /opt/homebrew/bin/displayplacer "id:95458444-A649-45C1-94AA-7D8880A7144F res:2304x1296 hz:60 color_depth:8 scaling:on origin:(0,0) degree:0" "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1728x1117 hz:120 color_depth:8 scaling:on origin:(-1728,338) degree:0" "id:AA4129F8-E94C-455C-A2CE-F3C7DF605E8E res:1152x2048 hz:60 color_depth:8 scaling:off origin:(2304,-578) degree:270" "id:B2085621-B801-4448-8FB9-30E7D08C1419 res:1344x756 hz:60 color_depth:8 scaling:off origin:(576,1296) degree:0"
else
  /usr/local/bin/desktoppr 0 "/Users/tomcraig/Dropbox/TomCraig/07 Pictures/Wallpapers/wave_1_no_notch.png"
fi
