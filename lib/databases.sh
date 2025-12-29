#!/bin/bash

# ============================================
# Databases Installation
# ============================================

install_databases() {
    print_section "Installing Databases"

    local databases=(
        "sqlite:SQLite"
        "mysql:MySQL"
        "redis:Redis"
    )

    for db in "${databases[@]}"; do
        IFS=':' read -r cmd desc <<< "$db"

        if brew list "$cmd" &> /dev/null; then
            print_info "$desc already installed"
        else
            run_command "brew install $cmd" "$desc"
        fi
    done

    print_info "To start MySQL: brew services start mysql"
    print_info "To start Redis: brew services start redis"
}
