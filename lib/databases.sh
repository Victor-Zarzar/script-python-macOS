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
        run_command "brew install $cmd" "$desc"
    done
}
