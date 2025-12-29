#!/bin/bash

# ============================================
# Applications Installation
# ============================================

install_apps() {
    print_section "Installing Applications"

    local apps=(
        "localsend:LocalSend"
        "keepassxc:KeePassXC"
        "telegram:Telegram"
        "orion:Orion Browser"
        "orbstack:OrbStack"
        "sublime-text:Sublime Text"
        "zed:Zed Editor"
        "android-studio:Android Studio"
        "discord:Discord"
        "notion:Notion"
        "spotify:Spotify"
        "onlyoffice:OnlyOffice"
        "google-drive:Google Drive"
        "omnidisksweeper:OmniDiskSweeper"
        "protonvpn:ProtonVPN"
        "crossover:CrossOver"
        "macs-fan-control:Macs Fan Control"
        "slack:Slack"
        "cloudflare-warp:Cloudflare WARP"
        "tunnelblick:Tunnelblick"
    )

    for app in "${apps[@]}"; do
        IFS=':' read -r cmd desc <<< "$app"

        if brew list --cask "$cmd" &> /dev/null; then
            print_info "$desc already installed"
        else
            run_command "brew install --cask $cmd" "$desc"
        fi
    done
}
