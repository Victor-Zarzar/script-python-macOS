#!/bin/bash

# ============================================
# Fonts Installation
# ============================================

install_fonts() {
    print_section "Installing Fonts"

    if brew list --cask font-jetbrains-mono-nerd-font &> /dev/null; then
        print_info "JetBrains Mono Nerd Font already installed"
    else
        run_command "brew install --cask font-jetbrains-mono-nerd-font" "JetBrains Mono Nerd Font"
    fi
}
