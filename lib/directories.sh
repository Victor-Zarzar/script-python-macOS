#!/bin/bash

# ============================================
# Directories Setup
# ============================================

setup_directories() {
    print_section "Setting Up Directories"

    local dirs=(
        "$HOME/Projects"
    )

    for dir in "${dirs[@]}"; do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir" && print_success "Created: $dir" || print_error "Failed to create: $dir"
        else
            print_info "Already exists: $dir"
        fi
    done

    log_action "Directories configured"
}
