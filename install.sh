#!/bin/bash

# Set install mode to online since boot.sh is used for curl installations
export MISTLETOE_ONLINE_INSTALL=true

ansi_art='
████        ███╗█████████╗█████████╗█████████╗███╗      █████████╗█████████╗█████████╗█████████╗
█████     █████║   ███╔══╝███╔═════╝   ███╔══╝███║      ███╔═════╝   ███╔══╝███╔══███║███╔═════╝
██████   ██████║   ███║   ███║         ███║   ███║      ███║         ███║   ███║  ███║███║
███║███ ███║███║   ███║   █████████╗   ███║   ███║      █████████╗   ███║   ███║  ███║█████████╗
███║ █████║ ███║   ███║         ███║   ███║   ███║      ███╔═════╝   ███║   ███║  ███║███╔═════╝
███║  ███║  ███║   ███║         ███║   ███║   ███║      ███║         ███║   ███║  ███║███║
███║  ╚══╝  ███║█████████╗█████████║   ███║   █████████╗█████████╗   ███║   █████████║█████████╗
╚══╝        ╚══╝╚════════╝╚════════╝   ╚══╝   ╚════════╝╚════════╝   ╚══╝   ╚════════╝╚════════╝    '

clear
echo -e "\n$ansi_art\n"

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default to me-osano/mistletoe
MISTLETOE_REPO="${MISTLETOE_REPO:-me-osano/mistletoe-mini}"

echo -e "\nCloning Mistletoe from: https://github.com/${MISTLETOE_REPO}"
rm -rf ~/.local/share/mistletoe/
git clone "https://github.com/${MISTLETOE_REPO}.git" ~/.local/share/mistletoe >/dev/null

# Use custom branch if instructed, otherwise default to master
MISTLETOE_REF="${MISTLETOE_REF:-master}"
if [[ $MISTLETOE_REF != "master" ]]; then
  echo -e "\e[32mUsing branch: $MISTLETOE_REF\e[0m"
  cd ~/.local/share/mistletoe
  git fetch origin "${MISTLETOE_REF}" && git checkout "${MISTLETOE_REF}"
  cd -
fi
    
echo -e "\nInstallation starting..."
source ~/.local/share/mistletoe/all.sh
