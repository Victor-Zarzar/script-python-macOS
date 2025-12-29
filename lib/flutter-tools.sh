#!/bin/bash

# ============================================
# Flutter Tools Installation
# ============================================

install_flutter_tools() {
    print_section "Installing Flutter Tools"

    if brew list fvm &> /dev/null; then
        print_info "FVM already installed ($(fvm --version 2>/dev/null || echo 'version unknown'))"
        return 0
    fi

    print_info "Adding FVM tap..."
    if brew tap leoafarias/fvm >> "$LOG_FILE" 2>&1; then
        run_command "brew install fvm" "Flutter Version Manager"
    else
        print_error "Failed to add FVM tap"
    fi
}
