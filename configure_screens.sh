#!/opt/homebrew/bin/zsh

desktoppr="/usr/local/bin/desktoppr"
displayPlacer="/opt/homebrew/bin/displayplacer"
wallpaperFolder="/Users/tomcraig/Dropbox/TomCraig/07 Pictures/Wallpapers"

#################
# DISPLAY NAMES #
#################
dell27="DELL S2722QC"
# 95458444-A649-45C1-94AA-7D8880A7144F
internal="Color LCD"
# 37D8832A-2D66-02CA-B9F7-8F30A301B230
hdmiStrip="HDMI"
# 3913815D-56F0-4FE7-90F7-6CB91892A81D
portable="K1301R"
# B2085621-B801-4448-8FB9-30E7D08C1419
dell25="DELL U2515H"
# AA4129F8-E94C-455C-A2CE-F3C7DF605E8E


##############
# WALLPAPERS #
##############
declare -A NameToIndex

IFS=$'\n'
screenarray=( $(system_profiler SPDisplaysDataType) )

# Loop over the array to get the matching display id and it's number
count=0
displayNum=0
until [ $count -gt $((${#screenarray[@]} + 1 )) ]; do
  if [[ "${screenarray[count]}" == *"${dell27}"* ]]; then
    $desktoppr $displayNum "${wallpaperFolder}/wave_2.jpg"
    displayNum=$(( $displayNum + 1 ))
  elif [[ "${screenarray[count]}" == *"${dell25}"* ]]; then
    $desktoppr $displayNum "${wallpaperFolder}/wave_3.jpeg"
    displayNum=$(( $displayNum + 1 ))
  elif [[ "${screenarray[count]}" == *"${internal}"* ]]; then
    $desktoppr $displayNum "${wallpaperFolder}/wave_1_no_notch.png"
    displayNum=$(( $displayNum + 1 ))
  elif [[ "${screenarray[count]}" == *"${hdmiStrip}"* ]]; then
    $desktoppr $displayNum "${wallpaperFolder}/wave_5.jpeg"
    displayNum=$(( $displayNum + 1 ))
  elif [[ "${screenarray[count]}" == *"${portable}"* ]]; then
    $desktoppr $displayNum "${wallpaperFolder}/wave_4.jpeg"
    displayNum=$(( $displayNum + 1 ))
  fi
  count=$(( $count + 1 ))
done

###############
# ARRANGEMENT #
###############
# It takes two tries to get this right because of bugginess in the resolution
$displayPlacer "id:95458444-A649-45C1-94AA-7D8880A7144F res:1920x1080 hz:60 color_depth:8 scaling:on origin:(0,0) degree:0" "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1024x662 hz:120 color_depth:8 scaling:on origin:(-1728,0) degree:0" "id:B2085621-B801-4448-8FB9-30E7D08C1419 res:1600x900 hz:60 color_depth:8 scaling:off origin:(-1600,1080) degree:0" "id:AA4129F8-E94C-455C-A2CE-F3C7DF605E8E res:1152x2048 hz:60 color_depth:8 scaling:off origin:(2304,-333) degree:270" "id:3913815D-56F0-4FE7-90F7-6CB91892A81D res:3008x862 hz:60 color_depth:8 scaling:off origin:(-704,-862) degree:0"

# This is the REAL configuration line
displayplacer "id:95458444-A649-45C1-94AA-7D8880A7144F res:2304x1296 hz:60 color_depth:8 scaling:on origin:(0,0) degree:0" "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1728x1117 hz:120 color_depth:8 scaling:on origin:(-1728,179) degree:0" "id:AA4129F8-E94C-455C-A2CE-F3C7DF605E8E res:1152x2048 hz:60 color_depth:8 scaling:off origin:(2304,-333) degree:270" "id:B2085621-B801-4448-8FB9-30E7D08C1419 res:1600x900 hz:60 color_depth:8 scaling:off origin:(325,1296) degree:0" "id:3913815D-56F0-4FE7-90F7-6CB91892A81D res:1920x550 hz:60 color_depth:8 scaling:off origin:(3456,-333) degree:0"