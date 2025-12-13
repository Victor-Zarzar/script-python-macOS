#!/bin/bash

# ============================================
# Shell Tools Installation
# ============================================

install_shell_tools() {
    print_section "Installing Shell Tools"

    local tools=(
        "starship:Starship prompt"
        "zsh-autosuggestions:ZSH autosuggestions"
        "eza:Modern ls replacement"
        "zoxide:Smart cd command"
        "bat:Better cat"
    )

    for tool in "${tools[@]}"; do
        IFS=':' read -r cmd desc <<< "$tool"
        run_command "brew install $cmd" "$desc"
    done
}
