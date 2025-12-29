#!/bin/bash

# ============================================
# Xcode Configuration
# ============================================

configure_xcode() {
    print_section "Finalizing Xcode Configuration"

    if [ -d "/Applications/Xcode.app" ]; then
        print_info "Xcode.app found"
        print_info "Configuring Xcode command line tools..."

        if sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch' >> "$LOG_FILE" 2>&1; then
            print_success "Xcode configured successfully"
        else
            print_warning "Xcode configuration may have failed (this is sometimes normal)"
        fi
    else
        print_warning "Xcode.app not found in /Applications"
        print_info "Install Xcode from App Store if you need full Xcode features"
        print_info "Command Line Tools are sufficient for most development tasks"
    fi

    log_action "Xcode configuration attempted"
}
