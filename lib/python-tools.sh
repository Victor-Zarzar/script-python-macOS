#!/bin/bash

# ============================================
# Python Tools Installation
# ============================================

install_python_tools() {
    print_section "Installing Python Tools"

    local python_tools=(
        "pyenv:Python version manager"
        "virtualenv:Virtual environments"
    )

    for tool in "${python_tools[@]}"; do
        IFS=':' read -r cmd desc <<< "$tool"
        run_command "brew install $cmd" "$desc"
    done

    print_info "Note: Install FastAPI, Uvicorn, and Alembic in your Python virtual environments using pip"
}
