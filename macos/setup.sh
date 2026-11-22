#!/usr/bin/env bash
# macOS and iTerm settings. Safe to re-run. Some changes need a logout or app restart.
set -euo pipefail

cd "$(dirname "$0")/.."

# --- Trackpad: tap to click -------------------------------------------------
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# --- Keyboard: fastest repeat rate and shortest delay System Settings offers -
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Holding a key in VS Code repeats it instead of showing the accent picker
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Tab moves between all controls in dialogs, not just text fields
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# --- Text: no "smart" substitutions that mangle code -----------------------
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# --- Window tiling shortcuts (Keyboard Shortcuts > Windows) -----------------
# hotkey <id> <character code> <key code>: sets the shortcut to Ctrl+Option+key.
# 786432 is the Ctrl+Option modifier mask; 65535 means "no character" (e.g. Return)
hotkey() {
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add "$1" \
    "<dict><key>enabled</key><true/><key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key><array><integer>$2</integer><integer>$3</integer><integer>786432</integer></array>
    </dict></dict>"
}
hotkey 237 65535 36  # Fill: Ctrl+Option+Return
# Key codes are physical key positions; these are H and L on a Dvorak layout
hotkey 240 104   38  # Tile Left Half: Ctrl+Option+H
hotkey 241 108   35  # Tile Right Half: Ctrl+Option+L
hotkey 239 48    29  # Return to Previous Size: Ctrl+Option+0

# --- Finder -----------------------------------------------------------------
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
# No .DS_Store files on network shares or USB drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# --- Dock -------------------------------------------------------------------
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock show-recents -bool false

# --- Screenshots go to ~/Screenshots instead of the Desktop -----------------
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location -string ~/Screenshots

# Restart the apps that only read these settings at launch, and reload keyboard shortcuts
killall Finder Dock SystemUIServer 2>/dev/null || true
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u 2>/dev/null || true

# --- Caps Lock -> Control ---------------------------------------------------
# A LaunchAgent reapplies it at every login; (re)loading it applies it now too
agent=~/Library/LaunchAgents/local.capslock-to-control.plist
mkdir -p ~/Library/LaunchAgents
cp -f macos/local.capslock-to-control.plist "$agent"
launchctl bootout "gui/$(id -u)" "$agent" 2>/dev/null || true
launchctl bootstrap "gui/$(id -u)" "$agent"

# --- 0xProto Nerd Font ------------------------------------------------------
# Installed straight from the Nerd Fonts release: the Homebrew cask needs sudo under Workbrew
if [ ! -f ~/Library/Fonts/0xProtoNerdFont-Regular.ttf ]; then
  tmp=$(mktemp -d)
  curl -fsSL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/0xProto.zip -o "$tmp/0xProto.zip"
  unzip -oq "$tmp/0xProto.zip" '0xProtoNerdFont-*.ttf' -d ~/Library/Fonts
  rm -rf "$tmp"
  echo "Installed 0xProto Nerd Font"
fi

# --- iTerm: Oceanic Dark colours + 0xProto Nerd Font as the default profile -
# It also starts fish directly, since making fish the login shell (chsh) needs admin
# Built as a dynamic profile from the .itermcolors file, so the colours stay in one place
profiles=~/Library/"Application Support"/iTerm2/DynamicProfiles
mkdir -p "$profiles"
plutil -convert json -o - iterm/oceanic-dark.itermcolors \
  | jq '{Profiles: [. + {
      "Name": "Oceanic Dark",
      "Guid": "oceanic-dark",
      "Dynamic Profile Parent Name": "Default",
      "Normal Font": "0xProtoNF 12",
      "Custom Command": "Yes",
      "Command": "/opt/homebrew/bin/fish -l"
    }]}' > "$profiles/oceanic-dark.json"
defaults write com.googlecode.iterm2 "Default Bookmark Guid" -string oceanic-dark

echo "macOS settings applied. Log out and back in for the keyboard and trackpad changes;"
echo "restart VS Code and iTerm for theirs."
