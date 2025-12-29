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

        if brew list "$cmd" &> /dev/null; then
            print_info "$desc already installed"
        else
            run_command "brew install $cmd" "$desc"
        fi
    done

    if ! grep -q 'starship init' "$HOME/.zshrc" 2>/dev/null; then
        echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
        print_success "Starship added to .zshrc"
    else
        print_info "Starship already configured in .zshrc"
    fi

    if ! grep -q 'zsh-autosuggestions' "$HOME/.zshrc" 2>/dev/null; then
        echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> "$HOME/.zshrc"
        print_success "ZSH autosuggestions added to .zshrc"
    else
        print_info "ZSH autosuggestions already configured in .zshrc"
    fi

    if ! grep -q 'zoxide init' "$HOME/.zshrc" 2>/dev/null; then
        echo 'eval "$(zoxide init zsh)"' >> "$HOME/.zshrc"
        print_success "Zoxide added to .zshrc"
    else
        print_info "Zoxide already configured in .zshrc"
    fi
}
