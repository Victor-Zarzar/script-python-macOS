#!/bin/bash

# ============================================
# Xcode Configuration
# ============================================

configure_xcode() {
    print_section "Finalizing Xcode Configuration"

    if [ -d "/Applications/Xcode.app" ]; then
        print_info "Configuring Xcode command line tools..."
        if sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch' >> "$LOG_FILE" 2>&1; then
            print_success "Xcode configured"
        else
            print_warning "Xcode configuration may have failed (this is sometimes normal)"
        fi
    else
        print_warning "Xcode.app not found. Install from App Store if needed."
    fi

    log_action "Xcode configuration attempted"
}
