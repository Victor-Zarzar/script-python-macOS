#!/bin/bash

# ============================================
# Flutter Tools Installation
# ============================================

install_flutter_tools() {
    print_section "Installing Flutter Tools"

    print_info "Adding FVM tap..."
    if brew tap leoafarias/fvm >> "$LOG_FILE" 2>&1; then
        run_command "brew install fvm" "Flutter Version Manager"
    else
        print_error "Failed to add FVM tap"
    fi
}
