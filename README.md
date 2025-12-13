# macOS Development Environment Setup

A comprehensive, modular automated setup script for macOS that helps install and configure your complete development environment with a single command.

## Features

- **Modular Architecture**: Clean, organized code split into focused modules
- **Homebrew Installation**: Automatic Homebrew installation and configuration
- **Shell Tools**: Starship, Zsh autosuggestions, Eza, Zoxide, Bat
- **Databases**: SQLite, MySQL, Redis
- **Development Tools**: Git, Node (NVM), PNPM, Bun, CocoaPods, Nginx, OpenJDK
- **Python Environment**: Pyenv, Virtualenv
- **Flutter Tools**: FVM (Flutter Version Manager)
- **Applications**: Zed Editor, Sublime Text, Android Studio, Discord, Notion, Spotify, and more
- **VPN & Security**: ProtonVPN, Cloudflare WARP, Tunnelblick
- **Utilities**: OrbStack, OmniDiskSweeper, LocalSend, KeePassXC
- **Interactive Configuration**: Git username and email setup
- **Xcode Configuration**: Automatic license acceptance and setup
- **Automatic Log Generation**: Detailed installation logs with timestamps

## Requirements

- macOS (any recent version)
- Terminal access
- Internet connection
- Sudo privileges for some operations

## Project Structure

```
setup-macos/
├── setup.sh              # Main script with interactive menu
├── lib/                  # Modular components
│   ├── colors.sh         # Color definitions for output
│   ├── helpers.sh        # Helper functions (print, log, run_command)
│   ├── prerequisites.sh  # Prerequisites verification
│   ├── homebrew.sh       # Homebrew installation
│   ├── directories.sh    # Directory creation
│   ├── fonts.sh          # Font installation
│   ├── shell-tools.sh    # Terminal tools
│   ├── databases.sh      # Database installation
│   ├── apps.sh           # GUI applications
│   ├── dev-tools.sh      # Development tools
│   ├── python-tools.sh   # Python tools
│   ├── flutter-tools.sh  # Flutter tools
│   ├── git-config.sh     # Git configuration
│   └── xcode-config.sh   # Xcode configuration
└── README.md             # This file
```

## Installation

Clone the repository:

```bash
git clone https://github.com/Victor-Zarzar/script-setup-macOS
```

Navigate to the directory:

```bash
cd script-setup-macOS
```

Make the script executable:

```bash
chmod +x setup.sh
```

## Usage

Run the script:

```bash
./setup.sh
```

The script will display an interactive menu with the following options:

1. Run complete setup
2. Check prerequisites
3. Install Homebrew only
4. Setup directories
5. Install fonts
6. Install shell tools
7. Install databases
8. Install applications
9. Install development tools
10. Install Python tools
11. Install Flutter tools
12. Configure Git
13. Configure Xcode
14. View installation log
15. Exit

## What Gets Installed

### Shell & Terminal

- **Starship**: Cross-shell prompt
- **Zsh Autosuggestions**: Fish-like autosuggestions
- **Eza**: Modern replacement for ls
- **Zoxide**: Smarter cd command
- **Bat**: Cat clone with syntax highlighting

### Databases

- **SQLite**: Lightweight database
- **MySQL**: Relational database
- **Redis**: In-memory data store

### Development Tools

- **Git**: Version control
- **NVM**: Node Version Manager
- **Bun**: Fast JavaScript runtime (installed via official tap: oven-sh/bun)
- **PNPM**: Fast, disk space efficient package manager
- **CocoaPods**: Dependency manager for Swift/Objective-C
- **Nginx**: Web server
- **Nmap**: Network mapper
- **OpenSSH**: Secure shell protocol
- **OpenJDK 21**: Java Development Kit

### Python Tools

- **Pyenv**: Python version manager
- **Virtualenv**: Virtual environment manager

**Note**: Install FastAPI, Uvicorn, and Alembic in your Python virtual environments using pip

### Flutter & Mobile

- **FVM**: Flutter Version Manager
- **Android Studio**: Android development IDE
- **Xcode**: iOS development (configuration only)

### Applications

- **Editors**: Zed Editor, Sublime Text, Android Studio
- **Browsers**: Orion
- **Communication**: Telegram, Discord, Slack
- **Productivity**: Notion, OnlyOffice
- **Entertainment**: Spotify
- **Cloud**: Google Drive
- **Security**: KeePassXC, ProtonVPN, Cloudflare WARP, Tunnelblick
- **Utilities**: LocalSend, OrbStack, OmniDiskSweeper, CrossOver, Macs Fan Control

### Fonts

- **JetBrains Mono Nerd Font**: Programming font with ligatures and icons

## Interactive Configuration

During the setup, you'll be asked to provide:

- **Git Username**: Your name for Git commits
- **Git Email**: Your email for Git commits

## Customization

### Adding New Software

1. Identify the correct module in `lib/`
2. Add the item to the corresponding list
3. Format: `"package-name:Description"`

Example in `lib/dev-tools.sh`:

```bash
local tools=(
    "git:Git"
    "your-tool:Your Description"
)
```

### Creating New Modules

1. Create file in `lib/module-name.sh`
2. Add shebang and section comment
3. Create function `install_module_name()`
4. Add source in `setup.sh`
5. Add option to menu

## Safety

- The script creates a detailed log file in your home directory
- Each installation shows success/failure status
- You can run individual installations instead of full setup
- Terminal restart is recommended after full setup

## Log Files

Log files are automatically created with timestamp:

```
~/macos_setup_YYYYMMDD_HHMMSS.log
```

View the log from the menu (option 14) or manually:

```bash
cat ~/macos_setup_*.log
```

## Directory Structure

The script automatically creates:

```
~/Projects  # Main projects directory
```

## Post-Installation

After running the script:

1. **Restart your terminal** for all changes to take effect
2. **Configure additional tools** as needed:
   - NVM: Install Node versions with `nvm install node`
   - FVM: Install Flutter versions with `fvm install stable`
   - Pyenv: Install Python versions with `pyenv install 3.12`
3. **Review the log file** for any errors or warnings
4. **Update installed applications** to their latest versions

## Tips

- Run option **1** (Complete setup) for a fresh macOS installation
- Use individual options to add specific tools later
- Check the log file if any installation fails
- Some installations may require additional manual configuration
- The modular structure makes it easy to customize for your needs

## Troubleshooting

If you encounter issues:

1. Check the log file for detailed error messages
2. Ensure you have a stable internet connection
3. Make sure you have enough disk space
4. Run individual installations to isolate problems
5. Some apps may require macOS system permissions
6. Xcode Command Line Tools must be installed (script handles this automatically)

### Common Issues

**Script doesn't execute:**

```bash
chmod +x setup.sh
./setup.sh
```

**Permission errors:**
Some installations may request administrator password.

**Xcode Command Line Tools:**
If not installed, the script will attempt automatic installation.

**View detailed errors:**

```bash
cat ~/macos_setup_*.log
```

## Advantages of Modular Architecture

- **Maintainability**: Each module has a specific responsibility
- **Readability**: Smaller, focused files
- **Reusability**: Modules can be used independently
- **Scalability**: Easy to add new modules
- **Debugging**: Easier to find and fix issues

## License

This project is open source and available under the MIT License.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

## Author

Victor Zarzar

---

**Note**: This script is designed for personal use. Review the code before running and adjust according to your needs.
