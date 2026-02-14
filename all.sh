#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

#-------------------------------------------------------------------------------
# 0. Prompt for Git user info
#-------------------------------------------------------------------------------

# Ensure we have gum available
if ! command -v gum &>/dev/null; then
  sudo pacman -S --needed --noconfirm gum
fi

# Prompt for Git identity
MISTLETOE_USER_NAME=$(gum input --prompt "  Enter your Git username: " --placeholder "Your name")
MISTLETOE_USER_EMAIL=$(gum input --prompt "  Enter your Git email: " --placeholder "you@example.com")

# Confirm identity visually
gum style --border normal --margin "1 2" --padding "1 3" --border-foreground 212 \
  "Git Identity Configuration:" \
  "\n    Name : $MISTLETOE_USER_NAME" \
  "\n    Email: $MISTLETOE_USER_EMAIL"

gum confirm "Proceed with these settings?" || exit 1

#-------------------------------------------------------------------------------
# 1. Define Mistletoe locations
#-------------------------------------------------------------------------------
export MISTLETOE_PATH="$HOME/.local/share/mistletoe"
export MISTLETOE_INSTALL="$MISTLETOE_PATH/install"
export MISTLETOE_INSTALL_LOG_FILE="/var/log/mistletoe-install.log"
export PATH="$MISTLETOE_PATH/bin:$PATH"
export MISTLETOE_USER_NAME
export MISTLETOE_USER_EMAIL

#-------------------------------------------------------------------------------
# 2. Begin modular installation
#-------------------------------------------------------------------------------
source "$MISTLETOE_INSTALL/helpers/all.sh"
source "$MISTLETOE_INSTALL/preflight/all.sh"
source "$MISTLETOE_INSTALL/packaging/all.sh"
source "$MISTLETOE_INSTALL/config/all.sh"
source "$MISTLETOE_INSTALL/login/all.sh"
source "$MISTLETOE_INSTALL/post-install/all.sh"