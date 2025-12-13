#!/bin/bash

# ============================================
# Git Configuration
# ============================================

configure_git() {
    print_section "Configuring Git"

    print_info "Enter your Git username:"
    read -r git_username

    print_info "Enter your Git email:"
    read -r git_email

    run_command "git config --global user.name '$git_username'" "Git username configured"
    run_command "git config --global user.email '$git_email'" "Git email configured"
}
