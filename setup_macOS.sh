#!/bin/bash

# ============================================
# macOS Development Environment Setup
# ============================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

LOG_FILE="$HOME/macos_setup_$(date +%Y%m%d_%H%M%S).log"
TOTAL_INSTALLED=0

# ============================================
# Helper Functions
# ============================================

print_header() {
    echo -e "${CYAN}╔════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║   macOS Development Environment       ║${NC}"
    echo -e "${CYAN}║   Setup & Configuration                ║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════╝${NC}"
    echo ""
}

print_section() {
    echo ""
    echo -e "${PURPLE}$1${NC}"
    echo "────────────────────────────────────────"
}

print_success() {
    echo -e "${GREEN}✅ SUCCESS:${NC} $1"
}

print_error() {
    echo -e "${RED}❌ ERROR:${NC} $1"
}

print_info() {
    echo -e "${BLUE}🔹 INFO:${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠️  WARNING:${NC} $1"
}

print_executing() {
    echo -e "${CYAN}🔹 Executing:${NC} $1"
}

log_action() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

run_command() {
    local cmd="$1"
    local description="$2"

    print_executing "$cmd"
    log_action "Executing: $cmd"

    if eval "$cmd" >> "$LOG_FILE" 2>&1; then
        print_success "${description:-Command completed}"
        ((TOTAL_INSTALLED++))
        return 0
    else
        print_error "${description:-Command failed}"
        log_action "ERROR: $cmd failed"
        return 1
    fi
}

# ============================================
# Pre-requisites Check
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
        print_success "Xcode Command Line Tools found"
    fi

    check_xcode_license || has_errors=true

    if [ "$has_errors" = true ]; then
        print_error "Prerequisites check failed. Please resolve issues and re-run."
        return 1
    fi

    print_success "All prerequisites met"
    return 0
}

# ============================================
# Installation Functions
# ============================================

install_homebrew() {
    print_section "Installing Homebrew"

    if command -v brew &> /dev/null; then
        print_info "Homebrew already installed"
        brew --version | head -n 1
        return 0
    fi

    print_info "Installing Homebrew..."

    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
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

setup_directories() {
    print_section "Setting Up Directories"

    local dirs=(
        "$HOME/Projects"
    )

    for dir in "${dirs[@]}"; do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir" && print_success "Created: $dir" || print_error "Failed to create: $dir"
        else
            print_info "Already exists: $dir"
        fi
    done

    log_action "Directories configured"
}

install_fonts() {
    print_section "Installing Fonts"

    run_command "brew install --cask font-jetbrains-mono-nerd-font" "JetBrains Mono Nerd Font"
}

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
        run_command "brew install $cmd" "$desc"
    done
}

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

install_apps() {
    print_section "Installing Applications"

    local apps=(
        "localsend:LocalSend"
        "keepassxc:KeePassXC"
        "telegram:Telegram"
        "orion:Orion Browser"
        "orbstack:OrbStack"
        "sublime-text:Sublime Text"
        "zed:Zed Editor"
        "android-studio:Android Studio"
        "discord:Discord"
        "notion:Notion"
        "spotify:Spotify"
        "onlyoffice:OnlyOffice"
        "google-drive:Google Drive"
        "omnidisksweeper:OmniDiskSweeper"
        "protonvpn:ProtonVPN"
        "crossover:CrossOver"
        "macs-fan-control:Macs Fan Control"
        "slack:Slack"
        "cloudflare-warp:Cloudflare WARP"
        "tunnelblick:Tunnelblick"
    )

    for app in "${apps[@]}"; do
        IFS=':' read -r cmd desc <<< "$app"
        run_command "brew install --cask $cmd" "$desc"
    done
}

install_development_tools() {
    print_section "Installing Development Tools"

    local tools=(
        "git:Git"
        "cocoapods:CocoaPods"
        "nvm:Node Version Manager"
        "bun:Bun runtime"
        "pnpm:PNPM"
        "nginx:Nginx"
        "nmap:Nmap"
        "openssh:OpenSSH"
        "openjdk@21:OpenJDK 21"
    )

    for tool in "${tools[@]}"; do
        IFS=':' read -r cmd desc <<< "$tool"
        run_command "brew install $cmd" "$desc"
    done
}

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

install_flutter_tools() {
    print_section "Installing Flutter Tools"

    print_info "Adding FVM tap..."
    if brew tap leoafarias/fvm >> "$LOG_FILE" 2>&1; then
        run_command "brew install fvm" "Flutter Version Manager"
    else
        print_error "Failed to add FVM tap"
    fi
}

configure_git() {
    print_section "Configuring Git"

    print_info "Enter your Git username:"
    read -r git_username

    print_info "Enter your Git email:"
    read -r git_email

    run_command "git config --global user.name '$git_username'" "Git username configured"
    run_command "git config --global user.email '$git_email'" "Git email configured"
}

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

# ============================================
# Interactive Menu
# ============================================

show_menu() {
    clear
    print_header
    echo "1)  Run complete setup"
    echo "2)  Check prerequisites"
    echo "3)  Install Homebrew only"
    echo "4)  Setup directories"
    echo "5)  Install fonts"
    echo "6)  Install shell tools"
    echo "7)  Install databases"
    echo "8)  Install applications"
    echo "9)  Install development tools"
    echo "10) Install Python tools"
    echo "11) Install Flutter tools"
    echo "12) Configure Git"
    echo "13) Configure Xcode"
    echo "14) View installation log"
    echo "0)  Exit"
    echo ""
    echo -n "Choose an option: "
}

run_full_setup() {
    print_header
    echo -e "${YELLOW}Starting complete setup...${NC}\n"

    if ! check_prerequisites; then
        print_error "Prerequisites check failed. Aborting setup."
        return 1
    fi

    install_homebrew
    setup_directories
    install_fonts
    install_shell_tools
    install_databases
    install_apps
    install_development_tools
    install_python_tools
    install_flutter_tools
    configure_git
    configure_xcode

    echo ""
    print_section "Setup Summary"
    echo -e "${GREEN}Total packages installed:${NC} $TOTAL_INSTALLED"
    echo -e "${GREEN}Log file:${NC} $LOG_FILE"
    echo ""
    print_success "Setup complete!"
    print_warning "Please restart your terminal for all changes to take effect"
    echo ""

    log_action "Complete setup finished - Total packages: $TOTAL_INSTALLED"
}

# ============================================
# Main Loop
# ============================================

main() {
    if [[ "$OSTYPE" != "darwin"* ]]; then
        print_error "This script is for macOS only!"
        exit 1
    fi

    touch "$LOG_FILE"
    log_action "Starting setup script"

    while true; do
        show_menu
        read -r option

        case $option in
            1) run_full_setup ;;
            2) check_prerequisites ;;
            3) install_homebrew ;;
            4) setup_directories ;;
            5) install_fonts ;;
            6) install_shell_tools ;;
            7) install_databases ;;
            8) install_apps ;;
            9) install_development_tools ;;
            10) install_python_tools ;;
            11) install_flutter_tools ;;
            12) configure_git ;;
            13) configure_xcode ;;
            14) cat "$LOG_FILE" | less ;;
            0)
                print_success "Goodbye!"
                log_action "Script finished"
                exit 0
                ;;
            *)
                print_error "Invalid option!"
                ;;
        esac

        echo ""
        read -p "Press ENTER to continue..."
    done
}

main
