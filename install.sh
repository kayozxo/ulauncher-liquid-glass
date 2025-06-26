#!/usr/bin/env bash

# === Color & Style Variables ===
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
NC='\033[0m' # No Color

# === Banner ===
echo -e "${CYAN}${BOLD}🚀 Starting Liquid Glass Theme Installer...${NC}"
echo

# === Ulauncher Check ===
read -p "$(echo -e "${CYAN}❓ Do you want to install Ulauncher themes? (yes/no): ${NC}")" answer
if [[ "$answer" != "yes" && "$answer" != "y" ]]; then
    echo -e "${YELLOW}⚠️ Skipping Ulauncher theme installation.${NC}"
    return 0 2>/dev/null || exit 0
fi

# === Ulauncher Check ===
if [ ! -d "$HOME/.config/ulauncher" ]; then
    echo -e "${RED}✗ Ulauncher is not installed.${NC}"
    echo -e "${YELLOW}💡 Please install it from: ${UNDERLINE}https://ulauncher.io/#Download${NC}"
    return 0 2>/dev/null || exit 0
fi

echo -e "${GREEN}✓ Ulauncher is installed.${NC}"

# === Prepare user-themes Directory ===
TARGET_DIR="$HOME/.config/ulauncher/user-themes"
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${BLUE}📁 Creating user-themes directory...${NC}"
    mkdir -p "$TARGET_DIR"
else
    echo -e "${GREEN}✓ user-themes directory already exists.${NC}"
fi

# === Determine Script Directory ===
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# === Install Themes ===
for theme in "liquid-glass-light" "liquid-glass-dark"; do
    SOURCE="$SCRIPT_DIR/$theme"
    DEST="$TARGET_DIR/$theme"

    # Remove existing version if it exists
    if [ -d "$DEST" ]; then
        echo -e "${YELLOW}🧹 Removing existing ${theme}...${NC}"
        rm -rf "$DEST"
    fi

    # Copy theme
    if [ -d "$SOURCE" ]; then
        echo -e "${CYAN}📦 Installing ${theme}...${NC}"
        cp -r "$SOURCE" "$TARGET_DIR/"
        echo -e "${GREEN}✓ ${theme} installed successfully.${NC}"
    else
        echo -e "${RED}⚠️  ${theme} folder not found in script directory. Skipping.${NC}"
    fi
done

echo
echo -e "${GREEN}${BOLD}🎉 Installation complete! Open Ulauncher Preferences to select your theme.${NC}"
