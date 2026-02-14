#!/bin/bash
# Add omarchy mirror and repository to pacman configuration

set -e  # Exit on error

MIRRORLIST="/etc/pacman.d/mirrorlist"
PACMAN_CONF="/etc/pacman.conf"
BACKUP_DIR="$HOME/Archive/.pacman-backups"

OMARCHY_MIRROR="Server = https://mirror.omarchy.org/\$repo/os/\$arch"
OMARCHY_REPO="[omarchy]
SigLevel = Optional TrustAll
Server = https://pkgs.omarchy.org/edge/\$arch"

echo "🚀 Configuring pacman & Setting up omarchy mirror and repository..."
echo ""

# Create backup directory
mkdir -p "$BACKUP_DIR"

# ============================================
# PART 1: ADD MIRROR TO MIRRORLIST
# ============================================

echo "📋 [1/2] Adding mirror to mirrorlist..."

if grep -q "mirror.omarchy.org" "$MIRRORLIST"; then
    echo "  ✅ omarchy mirror already exists in mirrorlist"
else
    # Backup mirrorlist
    MIRROR_BACKUP="$BACKUP_DIR/mirrorlist.backup.$(date +%Y%m%d-%H%M%S)"
    sudo cp "$MIRRORLIST" "$MIRROR_BACKUP"
    echo "  📦 Backup: $MIRROR_BACKUP"
    
    # Add mirror at top
    sudo sed -i "1a\\
\\
## omarchy mirror\\
$OMARCHY_MIRROR\\
" "$MIRRORLIST"
    
    echo "  ✅ omarchy mirror added to mirrorlist"
fi

echo ""

# ============================================
# PART 2: ADD REPO TO PACMAN.CONF
# ============================================

echo "📋 [2/2] Adding repository to pacman.conf..."

if grep -q "\[omarchy\]" "$PACMAN_CONF"; then
    echo "  ✅ omarchy repository already exists in pacman.conf"
else
    # Backup pacman.conf
    CONF_BACKUP="$BACKUP_DIR/pacman.conf.backup.$(date +%Y%m%d-%H%M%S)"
    sudo cp "$PACMAN_CONF" "$CONF_BACKUP"
    echo "  📦 Backup: $CONF_BACKUP"
    
    # Add repository at end
    echo "" | sudo tee -a "$PACMAN_CONF" > /dev/null
    echo "$OMARCHY_REPO" | sudo tee -a "$PACMAN_CONF" > /dev/null
    
    echo "  ✅ omarchy repository added to pacman.conf"
fi

# ============================================
# PART 3: CONFIGURE OPTIONS
# ============================================

echo "📋 [3/3] Configuring pacman options..."

# Backup if not already backed up
if [ ! -f "$CONF_BACKUP" ]; then
    CONF_BACKUP="$BACKUP_DIR/pacman.conf.backup.$(date +%Y%m%d-%H%M%S)"
    sudo cp "$PACMAN_CONF" "$CONF_BACKUP"
fi

CHANGES=0

# Function to ensure option
ensure_option() {
    local option="$1"
    local key=$(echo "$option" | cut -d'=' -f1 | xargs)
    
    # Check if it's a simple option or key=value
    if [[ "$option" == *"="* ]]; then
        # Key=Value option
        local value=$(echo "$option" | cut -d'=' -f2- | xargs)
        
        if grep -q "^${key}\s*=" "$PACMAN_CONF"; then
            echo "  ✅ $key - active"
        elif grep -q "^#${key}\s*=" "$PACMAN_CONF"; then
            sudo sed -i "s|^#${key}\s*=.*|${key} = ${value}|" "$PACMAN_CONF"
            echo "  🔧 $key - uncommented"
            CHANGES=1
        else
            sudo sed -i "/^\[options\]/a ${key} = ${value}" "$PACMAN_CONF"
            echo "  ➕ $key - added"
            CHANGES=1
        fi
    else
        # Simple option
        if grep -q "^${option}$" "$PACMAN_CONF"; then
            echo "  ✅ $option - active"
        elif grep -q "^#${option}$" "$PACMAN_CONF"; then
            sudo sed -i "s|^#${option}$|${option}|" "$PACMAN_CONF"
            echo "  🔧 $option - uncommented"
            CHANGES=1
        else
            sudo sed -i "/^\[options\]/a ${option}" "$PACMAN_CONF"
            echo "  ➕ $option - added"
            CHANGES=1
        fi
    fi
}

# Apply options
ensure_option "Color"
ensure_option "ILoveCandy"
ensure_option "VerbosePkgLists"
ensure_option "HoldPkg=pacman glibc"
ensure_option "Architecture=auto"
ensure_option "CheckSpace"
ensure_option "ParallelDownloads=5"
ensure_option "DownloadUser=alpm"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Setup complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Added to mirrorlist:"
echo "  ## omarchy mirror"
echo "  $OMARCHY_MIRROR"
echo ""
echo "Added to pacman.conf:"
echo "  [omarchy]"
echo "  SigLevel = Optional TrustAll"
echo "  Server = https://pkgs.omarchy.org/edge/\$arch"
echo ""
echo "📂 Backups saved to: $BACKUP_DIR"
echo ""
echo "🔄 Adding omarchy key and updating package database..."
sudo pacman-key --recv-keys 40DFB630FF42BCFFB047046CF0134EE680CAC571 --keyserver keys.openpgp.org
sudo pacman-key --lsign-key 40DFB630FF42BCFFB047046CF0134EE680CAC571

sudo pacman -Sy
sudo pacman -S --noconfirm --needed omarchy-keyring

echo "Refreshing all repos..."
sudo pacman -Syyu --noconfirm

echo ""
echo "✅ All done! omarchy mirror and repository are now active."
echo ""