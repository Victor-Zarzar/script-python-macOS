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

        if brew list "$cmd" &> /dev/null; then
            print_info "$desc already installed"
        else
            run_command "brew install $cmd" "$desc"
        fi
    done

    if ! grep -q 'pyenv init' "$HOME/.zshrc" 2>/dev/null; then
        cat >> "$HOME/.zshrc" << 'EOF'

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
EOF
        print_success "Pyenv added to .zshrc"
    else
        print_info "Pyenv already configured in .zshrc"
    fi

    print_info "Note: Install FastAPI, Uvicorn, and Alembic in your Python virtual environments using pip"
    print_info "Example: pip install fastapi uvicorn alembic"
}
