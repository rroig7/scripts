#!/bin/bash

# Neovim Configuration Installer
# This script pulls a Neovim config from GitHub and installs it to ~/.config/nvim

set -e  # Exit on error

# Configuration - CHANGE THIS to your GitHub repo URL
REPO_URL="https://github.com/rroig7/new-nvim.git"
CONFIG_DIR="$HOME/.config"
NVIM_DIR="$CONFIG_DIR/nvim"

echo "================================================"
echo "Neovim Configuration Installer"
echo "================================================"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "[ERROR] git is not installed. Please install git first."
    exit 1
fi
echo "[INFO] Git is installed"

# Create .config directory if it doesn't exist
if [ ! -d "$CONFIG_DIR" ]; then
    echo "[INFO] Creating .config directory..."
    mkdir -p "$CONFIG_DIR"
    echo "[INFO] Created $CONFIG_DIR"
else
    echo "[INFO] .config directory exists"
fi

# Check if nvim directory already exists
if [ -d "$NVIM_DIR" ]; then
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    BACKUP_DIR="${NVIM_DIR}_backup_${TIMESTAMP}"

    echo ""
    echo "[INFO] Existing nvim configuration found at: $NVIM_DIR"
    echo "[INFO] Renaming to: $BACKUP_DIR"

    mv "$NVIM_DIR" "$BACKUP_DIR"
    echo "[INFO] Backed up existing configuration to $BACKUP_DIR"
else
    echo "[INFO] No existing nvim configuration found"
fi

# Clone the repository
echo ""
echo "[INFO] Cloning Neovim configuration from GitHub..."
echo "[INFO] Repository: $REPO_URL"

if git clone "$REPO_URL" "$NVIM_DIR"; then
    echo "[INFO] Successfully cloned repository to $NVIM_DIR"
else
    echo "[ERROR] Failed to clone repository"
    exit 1
fi

# Remove .git directory (optional - uncomment if you want this)
# echo ""
# echo "[INFO] Removing .git directory..."
# rm -rf "$NVIM_DIR/.git"
# echo "[INFO] Removed .git directory"

echo ""
echo "================================================"
echo "Installation Complete!"
echo "================================================"
echo ""
echo "Your Neovim configuration has been installed to:"
echo "$NVIM_DIR"
echo ""
echo "You can now launch Neovim with: nvim"
echo ""
