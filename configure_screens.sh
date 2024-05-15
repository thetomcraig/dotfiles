#!/opt/homebrew/bin/zsh

desktoppr="/usr/local/bin/desktoppr"
displayPlacer="/opt/homebrew/bin/displayplacer"
wallpaperFolder="${HOME}/Documents/pictures/Wallpapers"

#################
# DISPLAY NAMES #
#################
# Get the UUID's of the monitors:
#   ioreg -l | grep EDID
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
dell22="DELL P2219H"



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
    $desktoppr $displayNum "${wallpaperFolder}/wave_1_large.png"
    displayNum=$(( $displayNum + 1 ))
  elif [[ "${screenarray[count]}" == *"${dell25}"* ]]; then
    $desktoppr $displayNum "${wallpaperFolder}/wave_3.jpeg"
    displayNum=$(( $displayNum + 1 ))
  elif [[ "${screenarray[count]}" == *"${dell22}"* ]]; then
    $desktoppr $displayNum "${wallpaperFolder}/wave_5.jpeg"
    displayNum=$(( $displayNum + 1 ))
  elif [[ "${screenarray[count]}" == *"${internal}"* ]]; then
    $desktoppr $displayNum "${wallpaperFolder}/wave_2_no_notch.png"
    echo "${wallpaperFolder}/wave_1_no_notch.png"
    displayNum=$(( $displayNum + 1 ))
  elif [[ "${screenarray[count]}" == *"${hdmiStrip}"* ]]; then
    $desktoppr $displayNum "${wallpaperFolder}/wave_4.jpeg"
    displayNum=$(( $displayNum + 1 ))
  elif [[ "${screenarray[count]}" == *"${portable}"* ]]; then
    $desktoppr $displayNum "${wallpaperFolder}/wave_4.jpeg"
    displayNum=$(( $displayNum + 1 ))
  fi
  count=$(( $count + 1 ))
done



# display placer command for screens with top strip:
# displayplacer "id:35120216-2552-4D1B-A398-C1EC8C9A4D7D res:2304x1296 hz:60 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0" "id:AF1BCCA1-F0C7-48F2-AD48-78343323861D res:1152x2048 hz:60 color_depth:8 enabled:true scaling:on origin:(2304,-440) degree:270" "id:12B5BF48-FC89-42C3-AF36-12434AA8CA8B res:3008x862 hz:60 color_depth:8 enabled:true scaling:on origin:(-704,-862) degree:180" "id:3344420E-5B08-40B6-9BE1-248F1B14B280 res:1920x1080 hz:60 color_depth:8 enabled:true scaling:on origin:(-1920,0) degree:0"



###############
# ARRANGEMENT #
###############

# Personal computer, with HDMI strip and not portable
# displayplacer "id:95458444-A649-45C1-94AA-7D8880A7144F res:2304x1296 hz:60 color_depth:8 scaling:on origin:(0,0) degree:0" "id:912EDD5D-2AB5-4DAA-9A74-674C7BBD99FD res:1152x2048 hz:60 color_depth:8 scaling:off origin:(2304,-396) degree:270" "id:3913815D-56F0-4FE7-90F7-6CB91892A81D res:3008x862 hz:60 color_depth:8 scaling:on origin:(-704,-862) degree:180" "id:397DC1C5-E579-44E5-B735-D35C282D16FF res:1920x1080 hz:60 color_depth:8 scaling:off origin:(-1920,0) degree:0"
#
# Personal computer, no HDMI strip and YESportable
# displayplacer "id:95458444-A649-45C1-94AA-7D8880A7144F res:2304x1296 hz:60 color_depth:8 scaling:on origin:(0,0) degree:0" "id:912EDD5D-2AB5-4DAA-9A74-674C7BBD99FD res:1152x2048 hz:60 color_depth:8 scaling:on origin:(2304,-340) degree:270" "id:B2085621-B801-4448-8FB9-30E7D08C1419 res:1344x756 hz:60 color_depth:8 scaling:off origin:(-1664,1080) degree:0" "id:397DC1C5-E579-44E5-B735-D35C282D16FF res:1920x1080 hz:60 color_depth:8 scaling:off origin:(-1920,0) degree:0"
#
#
#
#
# It takes two tries to get this right because of bugginess in the resolution
displayplacer "id:95458444-A649-45C1-94AA-7D8880A7144F res:1920x1080 hz:60 color_depth:8 scaling:on origin:(0,0) degree:0" "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1496x967 hz:120 color_depth:8 scaling:on origin:(-1496,179) degree:0" "id:912EDD5D-2AB5-4DAA-9A74-674C7BBD99FD res:1152x2048 hz:60 color_depth:8 scaling:off origin:(1920,-396) degree:270"

# This is the REAL configuration line
displayplacer "id:95458444-A649-45C1-94AA-7D8880A7144F res:1920x1080 hz:60 color_depth:8 scaling:on origin:(0,0) degree:0" "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1496x967 hz:120 color_depth:8 scaling:on origin:(-1496,179) degree:0" "id:912EDD5D-2AB5-4DAA-9A74-674C7BBD99FD res:1152x2048 hz:60 color_depth:8 scaling:off origin:(1920,-396) degree:270"
