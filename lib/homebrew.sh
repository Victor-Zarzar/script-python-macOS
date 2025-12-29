#!/bin/bash

# ============================================
# Homebrew Installation
# ============================================

install_homebrew() {
    print_section "Installing Homebrew"

    if command -v brew &> /dev/null; then
        print_info "Homebrew already installed ($(brew --version | head -n 1))"
        return 0
    fi

    print_info "Installing Homebrew..."

    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"

            if ! grep -q 'homebrew/bin/brew' "$HOME/.zprofile" 2>/dev/null; then
                echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
                print_success "Homebrew added to .zprofile"
            fi
        fi

        print_success "Homebrew installed successfully"
        log_action "Homebrew installed"
        return 0
    else
        print_error "Failed to install Homebrew"
        log_action "ERROR: Homebrew installation failed"
        return 1
    fi
}
