#!/usr/bin/env bash

set -e

echo "Installing yazi plugins..."
ya pkg install

echo "Installing zsh plugins..."
source $HOME/.zshenv

echo "Creating webapps..."
add-webapp -i "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/tailscale-light.png" "Tailscale" "https://login.tailscale.com/admin/machines"
add-webapp -i "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/notion-light.png" "Notion" "https://www.notion.so/"
add-webapp -i "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/chatgpt.png" "ChatGPT" "https://chatgpt.com/"
add-webapp -i "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/home-assistant.png" "Home Assistant" "https://homeassistant.griffin-frog.ts.net/"
add-webapp -i "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/glance.png" "Dashboard" "https://glance.griffin-frog.ts.net/"
add-webapp -i "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-calendar.png" "Calendar" "https://calendar.google.com"
add-webapp -i "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-sheets.png" "Finances" "https://docs.google.com/spreadsheets/d/1gHu9wtPCXs2HBX1UYcZvi7MvXkBJLjhqin3O30IRUKc"

echo "Installing neovim plugins..."
nvim +Lazy

echo "Done. Install tmux plugins with '<leader> + I'"
