#!/bin/bash

echo "✨ Starting setup"

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# TODO: does this linking work?
echo "Setting up dotfiles..."
if [ ! -d ~/dotfiles ]; then
  git clone https://github.com/mdt2/dotfiles.git ~/dotfiles
fi

cd ~/dotfiles

for link in .gitconfig .gitignore .zprofile .zshrc; do
  if [ -L "$HOME/$link" ]; then
    echo "Link '$link' exists"
  else
    ln -s "$PWD/$link" "$HOME/$link"
  fi
done

echo "Installing packages..."
brew install git
brew install git
brew install git-secrets
brew install jq
brew install nvm
brew install vim
brew install zsh

echo "Installing Heroku CLI..."
brew tap heroku/brew && brew install heroku

# TODO: does this syntax allow the script to keep running even if
# one of the installs fails or isn't available?
echo "Installing cask apps..."
brew install --cask 1password
brew install --cask alfred
brew install --cask bartender
brew install --cask caffeine
brew install --cask docker
brew install --cask dropbox
brew install --cask firefox
brew install --cask google-chrome
brew install --cask macdown
brew install --cask microsoft-teams
brew install --cask moom
brew install --cask recordit
brew install --cask skitch
brew install --cask slack
brew install --cask spotify
brew install --cask tableplus
brew install --cask visual-studio-code
brew install --cask zoom

# Development-friendly iOS settings from Sparkbox's laptop script.
# Hand-picked from https://mths.be/osx

echo "Setting handy development options..."
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Show the full URL in Safari's address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

echo "You'll need to restart your computer before all handy development options can take effect."

echo "Setting up oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Setup complete ✨"
