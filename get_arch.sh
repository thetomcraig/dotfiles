# arch (system architecture_
# macos or linux
arch=""

case "$(uname -s)" in
   Darwin)
     case "$(uname -m)" in
       x86_64)
         arch="macos_intel"
         ;;
       arm64)
         arch="macos_arm"
         ;;
     esac

     ;;
   Linux)
     arch="linux"
     ;;
esac

echo "${arch}"
