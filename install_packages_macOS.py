import subprocess

def run_command(command, use_sudo=False):
    if use_sudo:
        command = f"sudo {command}"
    try:
        print(f"Executing: {command}")
        subprocess.run(command, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error executing {command}: {e}")

commands = [
    '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"',
    '(echo; echo \'eval "$(/opt/homebrew/bin/brew shellenv)"\') >> ~/.zprofile',
    'eval "$(/opt/homebrew/bin/brew shellenv)"',
    "brew install --cask font-jetbrains-mono-nerd-font",
    "brew install starship",
    "brew install --cask localsend",
    "brew install --cask keepassxc",
    "brew install --cask telegram",
    "brew install cocoapods",
    "brew install node",
    "brew install pnpm",
    "brew install git",
    "git config --global user.name 'victorzarzar'",
    "git config --global user.email 'victor@example.com'",
    "brew install virtualenv",
    "brew install fastapi",
    "brew install uvicorn",
    "brew install openssh",
    "brew install --cask tunnelblick",
    "brew install openjdk@21",
    "brew install --cask orion",
    "brew install --cask orbstack",
    "brew install nginx",
    "brew install --cask sublime-text",
    "brew install --cask visual-studio-code",
    "brew install --cask android-studio",
    "brew install --cask discord",
    "brew install --cask notion",
    "brew install --cask spotify",
    "brew install --cask libreoffice",
    "brew install --cask zed",
    "brew install --cask google-chrome",
    "brew install --cask omnidisksweeper",
    "mkdir -p ~/Projects",
    "mkdir -p ~/development",
    "unzip ~/Downloads/flutter_macos_arm64_3.24.3-stable.zip -d ~/development/",
    "echo 'export PATH=$HOME/development/flutter/bin:$PATH' >> ~/.zshenv",
    "source ~/.zshenv",
    "sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'",
    "sudo xcodebuild -license"
]

for cmd in commands:
    if "sudo" in cmd:
        run_command(cmd, use_sudo=True)
    else:
        run_command(cmd)
