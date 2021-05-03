#!/bin/bash

echo "✨ Starting setup"

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing packages..."
brew install \
  git \
  git-secrets \
  jq \
  nvm \
  vim \
  zsh

echo "Installing Heroku CLI..."
brew tap heroku/brew && brew install heroku

echo "Installing cask apps..."
brew install --cask \
  1password \
  alfred \
  bartender \
  caffeine \
  docker \
  dropbox \
  firefox \
  google-chrome \
  gpg-suite \
  harvest \
  httpd \
  macdown \
  microsoft-teams \
  moom \
  recordit \
  skitch \
  slack \
  spotify \
  tableplus \
  visual-studio-code \
  zoom

echo "Setting up NVM..."
NODE_VERSION=14 PROFILE=/dev/null sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # loads nvm

echo "Installing rvm with auto-dotfiles support..."
curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles

# Development-friendly iOS settings.
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

fancy_echo "You'll need to restart your computer before all iOS settings can take effect."

echo "Setting up dotfiles..."
if [ ! -d ~/dotfiles ]; then
  git clone https://github.com/mdt2/dotfiles.git ~/dotfiles
fi

cd ~/dotfiles

for link in .gitconfig .gitignore .zprofile .zshrc do
  if [ -L "$HOME/$link" ]; then
    echo "Link '$link' exists"
  else
    ln -s "$PWD/$link" "$HOME/$link"
  fi
done

echo "Setting up oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Setup complete ✨"
