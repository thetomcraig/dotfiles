ARCH=""
IN_MACOS=false
IN_LINUX=false

case "$(uname -s)" in
   Darwin)
     case "$(uname -m)" in
       x86_64)
         ARCH="macos_intel"
         IN_MACOS=true
         ;;
       arm64)
         ARCH="macos_arm"
         IN_MACOS=true
         ;;
     esac

     ;;
   Linux)
     ARCH="linux"
     IN_LINUX=true
     ;;
esac

export IN_MACOS="${IN_MACOS}"
export IN_LINUX="${IN_LINUX}"
export ARCH="${ARCH}"

