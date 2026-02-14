# Mistletoe

```
████        ███╗█████████╗█████████╗█████████╗███╗      █████████╗█████████╗█████████╗█████████╗
█████     █████║   ███╔══╝███╔═════╝   ███╔══╝███║      ███╔═════╝   ███╔══╝███╔══███║███╔═════╝
██████   ██████║   ███║   ███║         ███║   ███║      ███║         ███║   ███║  ███║███║
███║███ ███║███║   ███║   █████████╗   ███║   ███║      █████████╗   ███║   ███║  ███║█████████╗
███║ █████║ ███║   ███║         ███║   ███║   ███║      ███╔═════╝   ███║   ███║  ███║███╔═════╝
███║  ███║  ███║   ███║         ███║   ███║   ███║      ███║         ███║   ███║  ███║███║
███║  ╚══╝  ███║█████████╗█████████║   ███║   █████████╗█████████╗   ███║   █████████║█████████╗
╚══╝        ╚══╝╚════════╝╚════════╝   ╚══╝   ╚════════╝╚════════╝   ╚══╝   ╚════════╝╚════════╝
```

A beautiful, modern Arch Linux starter template featuring Hyprland and a curated selection of tools and configurations.

## Features

- **Hyprland** - Modern tiling Wayland compositor
- **16+ Themes** - Including Catppuccin, Tokyo Night, Gruvbox, Nord, Rose Pine, and more
- **Pre-configured Applications** - Alacritty, Ghostty, Waybar, btop, lazygit, Neovim-ready
- **Utility Scripts** - Battery monitoring, brightness control, screen recording, screenshots
- **Docker & Dev Tools** - Ready for development with Docker, Git, and language toolchains

## Prerequisites

Before installing, ensure your Arch system has:

- **Btrfs** filesystem
- **Snapper** for snapshot management
- **GRUB** bootloader
- No display manager (DM-free setup)

## Installation

### Quick Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/me-osano/mistletoe-mini/master/install.sh | bash
```

### Manual Install

```bash
git clone https://github.com/me-osano/mistletoe-mini ~/.local/share/mistletoe
cd ~/.local/share/mistletoe
./all.sh
```

### Custom Repository/Branch

```bash
MISTLETOE_REPO="your-username/your-fork" MISTLETOE_REF="your-branch" \
  curl -fsSL https://raw.githubusercontent.com/me-osano/mistletoe-mini/master/install.sh | bash
```

## Themes

| Theme | Style |
|-------|-------|
| Catppuccin | Warm pastel palette |
| Catppuccin Latte | Light warm pastel |
| Tokyo Night | Dark blue aesthetic |
| Gruvbox | Retro warm colors |
| Nord | Arctic cool tones |
| Rose Pine | Elegant muted tones |
| Kanagawa | Japanese ink palette |
| Everforest | Soft green nature |
| Ethereal | Dreamy atmosphere |
| Flexoki Light | Minimal light theme |
| Hackerman | Cyberpunk green |
| Matte Black | Pure dark minimal |
| Miasma | Dark purple haze |
| Osaka Jade | Jade green accent |
| Ristretto | Coffee-inspired |
| Vantablack | Ultra-dark |

## Included Applications

**Terminals:** Alacritty, Ghostty, Kitty  
**Browsers:** Brave, Chromium  
**System:** btop, fastfetch, Waybar, Walker  
**Development:** lazygit, Docker, Neovim configs  
**Utilities:** imv, grim, hyprpicker, wl-clipboard

## Project Structure

```
mistletoe/
├── bin/           # Utility scripts (mistletoe-*)
├── config/        # Application configurations
├── themes/        # Color schemes
├── install/       # Installation modules
├── applications/  # Desktop entries
└── migrations/    # Version migration scripts
```

## License

Released under the [MIT License](LICENSE).