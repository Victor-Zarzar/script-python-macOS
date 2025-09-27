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


# Homebrew Installation (Isolated Step)
def install_homebrew():
    print("🔸 Instalando Homebrew...")
    try:
        subprocess.run(
            '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"',
            shell=True,
            check=True
        )
        # Update shellenv in the script for the next commands weighing on `brew`
        shellenv_cmd = '$(/opt/homebrew/bin/brew shellenv)'
        result = subprocess.run(
            f'eval "{shellenv_cmd}" && echo "export PATH={os.environ["PATH"]}:$(brew --prefix)/bin" >> ~/.zprofile',
            shell=True,
            executable="/bin/zsh"
        )
        os.environ["PATH"] += f':/opt/homebrew/bin'
        print("✅ Homebrew instalado e PATH atualizado.")
    except subprocess.CalledProcessError as e:
        print(f"❌ Falha ao instalar o Homebrew: {e}")


install_homebrew()

# Main commands after Homebrew
commands = [
    'mkdir -p ~/Projects',
    "brew install --cask font-jetbrains-mono-nerd-font",
    "brew install starship",
    "brew install zsh-autosuggestions",
    "brew install eza",
    "brew install zoxide",
    "brew install bat",
    "brew install sqlite",
    "brew install mysql",
    "brew install --cask localsend",
    "brew install --cask keepassxc",
    "brew install --cask telegram",
    "brew install cocoapods",
    "brew install nvm",
    "brew install pnpm",
    "brew install git",
    "git config --global user.name 'victorzarzar'",
    "git config --global user.email 'victorzarzar@example.com'",
    "brew install virtualenv",
    "brew install fastapi",
    "brew install pyenv",
    "brew install uvicorn",
    "brew install openssh",
    "brew install --cask tunnelblick",
    "brew install openjdk@21",
    "brew install --cask orion",
    "brew install --cask orbstack",
    "brew install nginx",
    "brew install redis",
    "brew install --cask sublime-text",
    "brew install --cask visual-studio-code",
    "brew install --cask android-studio",
    "brew install --cask discord",
    "brew install --cask notion",
    "brew install --cask spotify",
    "brew install --cask onlyoffice",
    "brew install --cask google-chrome",
    "brew install --cask google-drive",
    "sudo xcodebuild -license accept",
    "brew install --cask omnidisksweeper",
    "brew install --cask protonvpn",
    "brew install --cask crossover",
    "brew install --cask the-unarchiver",
    "brew install --cask macs-fan-control",
    "brew install gh",
    "sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'",
    "brew tap leoafarias/fvm",
    "brew install fvm",
    "brew install --cask slack",
    "brew install --cask cloudflare-warp"
]

for cmd in commands:
    if cmd.startswith("sudo"):
        run_command(cmd, use_sudo=True)
    else:
        run_command(cmd)

print("\n✅ Instalação concluída!")

