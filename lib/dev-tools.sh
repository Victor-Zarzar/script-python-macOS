#!/bin/bash

# ============================================
# Development Tools Installation
# ============================================

install_development_tools() {
    print_section "Installing Development Tools"

    local tools=(
        "git:Git"
        "cocoapods:CocoaPods"
        "nvm:Node Version Manager"
        "pnpm:PNPM"
        "nginx:Nginx"
        "nmap:Nmap"
        "openssh:OpenSSH"
        "openjdk@21:OpenJDK 21"
    )

    for tool in "${tools[@]}"; do
        IFS=':' read -r cmd desc <<< "$tool"
        run_command "brew install $cmd" "$desc"
    done

    # Install Bun using official tap
    print_info "Adding Bun tap..."
    if brew tap oven-sh/bun >> "$LOG_FILE" 2>&1; then
        run_command "brew install bun" "Bun runtime"
    else
        print_error "Failed to add Bun tap"
    fi
}
