#!/bin/bash

# ============================================
# Prerequisites Check
# ============================================

check_xcode_license() {
    print_section "Checking Xcode License"

    if ! xcodebuild -license check &> /dev/null; then
        print_warning "Xcode license not accepted!"
        print_info "Attempting to accept Xcode license..."

        if sudo xcodebuild -license accept >> "$LOG_FILE" 2>&1; then
            print_success "Xcode license accepted"
            log_action "Xcode license accepted"
            return 0
        else
            print_error "Failed to accept Xcode license"
            print_warning "Please run manually: sudo xcodebuild -license accept"
            log_action "ERROR: Xcode license acceptance failed"
            return 1
        fi
    else
        print_success "Xcode license already accepted"
        return 0
    fi
}

check_prerequisites() {
    print_section "Checking Prerequisites"

    local has_errors=false

    if ! xcode-select -p &> /dev/null; then
        print_error "Xcode Command Line Tools not found!"
        print_info "Installing Xcode Command Line Tools..."

        if xcode-select --install 2>> "$LOG_FILE"; then
            print_warning "Please complete the installation and re-run the script"
            exit 1
        fi
    else
        print_success "Xcode Command Line Tools found ($(xcode-select -p))"
    fi

    check_xcode_license || has_errors=true

    if [ "$has_errors" = true ]; then
        print_error "Prerequisites check failed. Please resolve issues and re-run."
        return 1
    fi

    print_success "All prerequisites met"
    return 0
}
