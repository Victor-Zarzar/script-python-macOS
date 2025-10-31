# macOS Development Environment Setup

A comprehensive automated setup script for macOS that helps install and configure your complete development environment with a single command.

## Features

- **Homebrew Installation**: Automatic Homebrew installation and configuration
- **Shell Tools**: Starship, Zsh autosuggestions, Eza, Zoxide, Bat
- **Databases**: SQLite, MySQL, Redis
- **Development Tools**: Git, Node (NVM), PNPM, CocoaPods, Nginx, OpenJDK
- **Python Environment**: Pyenv, Virtualenv, FastAPI, Uvicorn, Alembic
- **Flutter Tools**: FVM (Flutter Version Manager)
- **Applications**: VS Code, Android Studio, Sublime Text, Discord, Notion, Spotify, and more
- **VPN & Security**: ProtonVPN, Cloudflare WARP, Tunnelblick
- **Utilities**: OrbStack, OmniDiskSweeper, LocalSend, KeePassXC
- **Interactive Configuration**: Git username and email setup
- **Xcode Configuration**: Automatic license acceptance and setup
- **Automatic log generation**: Detailed installation logs

## Requirements

- macOS (any recent version)
- Terminal access
- Internet connection
- Sudo privileges for some operations

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
chmod +x setup_macOS.sh
```

## Usage

Run the script:

```bash
./setup_macOS.sh
```

The script will display an interactive menu with the following options:

1. Run complete setup
2. Install Homebrew only
3. Setup directories
4. Install fonts
5. Install shell tools
6. Install databases
7. Install applications
8. Install development tools
9. Install Python tools
10. Install Flutter tools
11. Configure Git
12. Configure Xcode
13. View installation log

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
- **PNPM**: Fast, disk space efficient package manager
- **CocoaPods**: Dependency manager for Swift/Objective-C
- **Nginx**: Web server
- **OpenJDK 21**: Java Development Kit
- **OpenSSH**: Secure shell protocol

### Python Tools
- **Pyenv**: Python version manager
- **Virtualenv**: Virtual environment manager
- **FastAPI**: Modern web framework
- **Uvicorn**: ASGI server
- **Alembic**: Database migration tool

### Flutter & Mobile
- **FVM**: Flutter Version Manager
- **Android Studio**: Android development IDE
- **Xcode**: iOS development (configuration only)

### Applications
- **Editors**: Visual Studio Code, Sublime Text, Android Studio
- **Browsers**: Orion
- **Communication**: Telegram, Discord, Slack
- **Productivity**: Notion, OnlyOffice
- **Entertainment**: Spotify
- **Cloud**: Google Drive
- **Security**: KeePassXC, ProtonVPN, Cloudflare WARP, Tunnelblick
- **Utilities**: LocalSend, OrbStack, OmniDiskSweeper, CrossOver, Macs Fan Control

### Fonts
- **JetBrains Mono Nerd Font**: Programming font with ligatures

## Interactive Configuration

During the setup, you'll be asked to provide:

- **Git Username**: Your name for Git commits
- **Git Email**: Your email for Git commits

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

## Directory Structure

The script automatically creates:

```
~/Projects  # Main projects directory
```

## Post-Installation

After running the script:

1. **Restart your terminal** for all changes to take effect
2. **Configure additional tools** as needed (e.g., NVM Node versions, FVM Flutter versions)
3. **Review the log file** for any errors or warnings
4. **Update installed applications** to their latest versions

## Tips

- Run option **1** (Complete setup) for a fresh macOS installation
- Use individual options to add specific tools later
- Check the log file if any installation fails
- Some installations may require additional manual configuration

## Troubleshooting

If you encounter issues:

1. Check the log file for detailed error messages
2. Ensure you have a stable internet connection
3. Make sure you have enough disk space
4. Run individual installations to isolate problems
5. Some apps may require macOS system permissions

## License

This project is open source and available under the MIT License.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

## Author

Victor Zarzar

---

**Note**: This script is designed for personal use. Review the code before running and adjust according to your needs.