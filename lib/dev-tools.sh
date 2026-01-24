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
        "mackup: Backup Sync"
        "mas: Command-line Interface"
    )

    for tool in "${tools[@]}"; do
        IFS=':' read -r cmd desc <<< "$tool"

        if brew list "$cmd" &> /dev/null; then
            print_info "$desc already installed"
        else
            run_command "brew install $cmd" "$desc"
        fi
    done

    # Install Bun using official tap
    print_info "Checking Bun installation..."

    if brew list bun &> /dev/null; then
        print_info "Bun already installed ($(bun --version 2>/dev/null || echo 'version unknown'))"
    else
        print_info "Adding Bun tap..."
        if brew tap oven-sh/bun >> "$LOG_FILE" 2>&1; then
            run_command "brew install bun" "Bun runtime"
        else
            print_error "Failed to add Bun tap"
        fi
    fi
}
