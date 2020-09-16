#!/usr/bin/env bash

echo "Simple jailbreak info script by @Basti564"

if [[ $EUID -eq 0 ]]; then
  echo "[!] Please don't run this script as root!"
  exit
fi
if [[ $(command -v sudo -u brew) == "" ]]; then
    echo "[!] Hombrew not installed!"
    echo "[!] Please run the following command!"
    echo '[!] /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    exit
else
    echo "[§] Found Homebrew"
    if brew ls --versions ideviceinstaller > /dev/null; then
      echo "[§] Found ideviceinstaller"
    else
      echo "[!] ideviceinstaller not found!"
      echo "[!] Please install ideviceinstaller with the following command"
      echo "[!] brew install ideviceinstaller"
      exit
    fi
fi

echo "[§] Collecting system apps"
sys_apps=$(ideviceinstaller -l -o list_system)
echo "[§] Collecting user apps"
usr_apps=$(ideviceinstaller -l -o list_user)

function package_manager() {
  if echo "$sys_apps" | grep -q "com.saurik.Cydia"; then
    	echo "PackageManager: Cydia"
  fi

  if echo "$sys_apps" | grep -q "org.coolstar.SileoStore"; then
    	echo "PackageManager: Sileo"
  fi

  if echo "$sys_apps" | grep -q "xyz.willy.Zebra"; then
    	echo "PackageManager: Zebra"
  fi

  if echo "$sys_apps" | grep -q "me.apptapp.installer"; then
    	echo "PackageManager: Installer"
  fi
}

function popular_tweaks() {
  if echo "$sys_apps" | grep -q "com.tigisoftware.Filza"; then
      echo "Filemanager: Filza"
  fi

  if echo "$sys_apps" | grep -q "ws.hbang.Terminal"; then
      echo "TerminalEMU: NewTerm"
  fi

  if echo "$sys_apps" | grep -q "com.officialscheduler.mterminal"; then
      echo "TerminalEMU: MTerminal"
  fi

  if echo "$sys_apps" | grep -q "com.anemonetheming.anemone"; then
      echo "ThemeEngine: Anemone (old?)"
  fi

  if echo "$sys_apps" | grep -q "com.anemoneteam.anemone"; then
      echo "ThemeEngine: Anemone"
  fi

  if echo "$sys_apps" | grep -q "com.julioverne.cydown"; then
      echo "PiracyTool: CyDown"
  fi
}

function jailbreak_tool() {
  if echo "$usr_apps" | grep -q "org.coolstar.odyssey"; then
    echo "JailbreakTool: Odyssey"
  fi

  if echo "$usr_apps" | grep -q "science.xnu.undecimus"; then
    echo "JailbreakTool: Unc0ver"
  fi

  if echo "$usr_apps" | grep -q "us.diatr.undecimus"; then
    echo "JailbreakTool: Unc0ver Dark"
  fi

  if echo "$usr_apps" | grep -q ".chimera13"; then
    echo "JailbreakTool: Chimera13"
  fi

  if echo "$usr_apps" | grep -q "com.electrateam.chimera"; then
    echo "JailbreakTool: Chimera"
  fi

  if echo "$usr_apps" | grep -q "org.brandonplank.rootlessJB"; then
    echo "JailbreakTool: RootlessJB4"
  fi

  if echo "$usr_apps" | grep -q "org.coolstar.electra1141"; then
    echo "JailbreakTool: Electra"
  fi

  if echo "$usr_apps" | grep -q "com.newosxbook.qilin.LiberiOS--"; then
    echo "JailbreakTool: LiberiOS"
  fi

  if echo "$usr_apps" | grep -q "com.cheesecakeufo.topanga"; then
    echo "JailbreakTool: to.panga"
  fi
}

function jailbreak_related() {
  if echo "$sys_apps" | grep -q "kjc.loader"; then
    echo "JailbreakLoader: Checkra1n"
  fi
  if echo "$sys_apps" | grep -q "org.coolstar.SafeMode"; then
    echo "SafeMode: Coolstar"
  fi
}

function apple_internal() {
  if echo "$sys_apps" | grep -q "com.apple.TapToRadar"; then
    echo "AppleInternal: TapToRadar"
  fi

  if echo "$usr_apps" | grep -q "com.apple.ist.outpost"; then
    echo "AppleInternal: Outpost"
  fi

  if echo "$usr_apps" | grep -q "com.ist.apple.MyMessage"; then
    echo "AppleInternal: MyMessage"
  fi


  if echo "$usr_apps" | grep -q "com.apple.ist.NetworkCheck"; then
    echo "AppleInternal: NetworkCheck"
  fi

  if echo "$usr_apps" | grep -q "com.apple.ist.training.staff"; then
    echo "AppleInternal: MyDemo"
  fi

  if echo "$usr_apps" | grep -q "com.apple.ist.events"; then
    echo "AppleInternal: Events"
  fi

  if echo "$usr_apps" | grep -q "com.ist.apple.seed"; then
    echo "AppleInternal: (Sales-)Seed"
  fi

  if echo "$usr_apps" | grep -q "com.apple.ist.sbm"; then
    echo "AppleInternal: Switchboard"
  fi

  if echo "$usr_apps" | grep -q "com.apple.ist.appleconnect"; then
    echo "AppleInternal: AppleConnect"
  fi

  if echo "$usr_apps" | grep -q "com.apple.MesaStoreDemo"; then
    echo "AppleInternal: Touch ID"
  fi

  if echo "$usr_apps" | grep -q "com.apple.FaceIDStoreDemo"; then
    echo "AppleInternal: Face ID"
  fi
}

jailbreak_related
jailbreak_tool
package_manager
popular_tweaks
apple_internal
