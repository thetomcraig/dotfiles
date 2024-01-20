ARCH=""
IN_MACOS=false
IN_LINUX=false
IN_WSL=false
IN_WINDOWS=false
IN_POWERSHELL=false
IN_SSH=false

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
    if [ -e /proc/sys/kernel/osrelease ]; then
      ARCH="wsl"
      IN_WSL=true
      IN_WINDOWS=true
    else
     ARCH="linux"
     IN_LINUX=true
    fi
  ;;
esac

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  IN_SSH=true
fi

export IN_MACOS="${IN_MACOS}"
export IN_LINUX="${IN_LINUX}"
export IN_WSL="${IN_WSL}"
export IN_WINDOWS="${IN_WINDOWS}"
export IN_POWERSHELL="${IN_POWERSHELL}"
export IN_SSH="${IN_SSH}"
export ARCH="${ARCH}"
