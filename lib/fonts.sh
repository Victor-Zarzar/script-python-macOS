#!/bin/bash

# ============================================
# Fonts Installation
# ============================================

install_fonts() {
    print_section "Installing Fonts"

    run_command "brew install --cask font-jetbrains-mono-nerd-font" "JetBrains Mono Nerd Font"
}
