import subprocess
import os

def run_command(command, use_sudo=False):
    if use_sudo:
        command = f"sudo {command}"
    try:
        print(f"🔹 Executando: {command}")
        subprocess.run(command, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"❌ Erro ao executar {command}: {e}")

def setup_homebrew():
    homebrew_check_cmd = '/opt/homebrew/bin/brew --version'
    try:
        subprocess.run(homebrew_check_cmd, shell=True, check=True)
        print("✅ Homebrew já instalado.")
    except subprocess.CalledProcessError:
        run_command('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
     
        shell_config = os.path.expanduser('~/.zprofile')
        with open(shell_config, 'a') as file:
            file.write('\n# Homebrew\n')
            file.write('eval "$(/opt/homebrew/bin/brew shellenv)"\n')
        subprocess.run('eval "$(/opt/homebrew/bin/brew shellenv)"', shell=True)
        print("✅ Homebrew instalado e configurado.")

setup_homebrew()

commands = [
    # Fontes e visual
    "brew install --cask font-jetbrains-mono-nerd-font",

    # Terminal
    "brew install starship",
    "brew install zsh-autosuggestions",
    "brew install fzf",
    "brew install eza",
    "brew install zoxide",
    "brew install bat",

    # Banco de dados e backend
    "brew install sqlite",
    "brew install mysql",
    "brew install redis",
    "brew install nginx",

    # Python e ambiente
    "brew install pyenv",
    "brew install virtualenv",
    "brew install openssh",
    "brew install fastapi",
    "brew install uvicorn",

    # Node & Dev
    "brew install node",
    "brew install pnpm",
    "brew install git",

    # Git config
    "git config --global user.name 'victorzarzar'",
    "git config --global user.email 'victor@example.com'",

    # Java
    "brew install openjdk@21",

    # Apple e Xcode
    "sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'",
    "sudo xcodebuild -license",
    "softwareupdate --install-rosetta --agree-to-license",

    # FVM e Flutter
    "brew tap leoafarias/fvm",
    "brew install fvm",

    # Apps essenciais
    "brew install --cask localsend",
    "brew install --cask keepassxc",
    "brew install --cask telegram",
    "brew install --cask tunnelblick",
    "brew install --cask orion",

    "brew install --cask sublime-text",
    "brew install --cask visual-studio-code",
    "brew install --cask android-studio",
    "brew install --cask discord",
    "brew install --cask notion",
    "brew install --cask spotify",
    "brew install --cask libreoffice",
    "brew install --cask google-chrome",
    "brew install --cask google-drive",
    "brew install --cask omnidisksweeper",
    "brew install --cask protonvpn",
    "brew install --cask macs-fan-control",

    # GitHub CLI
    "brew install gh",

    # Docker
    "brew install --cask orbstack",
]

for cmd in commands:
    if cmd.startswith("sudo"):
        run_command(cmd, use_sudo=True)
    else:
        run_command(cmd)

print("\n✅ Instalação concluída!")