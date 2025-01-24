#!/usr/bin/env zsh

# Close open System Preferences panes, to prevent them from overriding settings.
osascript -e 'tell application "System Preferences" to quit'

# Appearance
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"       # Set scrollbar hiding

# TextInput(global)
defaults write com.apple.TextInputMenu visible -bool false                      # Hide Textinput menu in menubar
defaults write NSGlobalDomain InitialKeyRepeat -int 15                          # Set initial key repeat rate to 225ms(logout required)
defaults write NSGlobalDomain KeyRepeat -int 2                                  # Set key repeat rate to 30ms(logout required)
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false    # Disable smart dashes
defaults write NSGlobalDomain NSAutomaticInlinePredictionEnabled -bool false    # Disable inline prediction
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false  # Disable period substitution.
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false   # Disable smart quotes
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false  # Disable auto-correct
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false # Disable auto-correct(in web)

# TextInput(kotoeri)
defaults write com.apple.inputmethod.Kotoeri JIMPrefAutocorrectionKey -bool false             # Disable AutoCorrection in Japanese
defaults write com.apple.inputmethod.Kotoeri JIMPrefCharacterForYenKey -int 1                 # "Yen" key to backslash(\)
defaults write com.apple.inputmethod.Kotoeri JIMPrefFullWidthNumeralCharactersKey -bool false # Disable full width numeral character

# Clock
defaults write com.apple.menuextra.clock ShowSeconds -bool true                                                                                                 # Show Seconds
defaults write com.apple.speech.synthesis.general.prefs TimeAnnouncementPrefs -dict-add "TimeAnnouncementsEnabled" -bool true                                   # Enable Time announcement
defaults write com.apple.speech.synthesis.general.prefs TimeAnnouncementPrefs -dict-add "TimeAnnouncementsIntervalIdentifier" -string "EveryHalfHourInterval"   # Time announcement every 30 minutes

## Dock
defaults write com.apple.dock magnification -bool true           # Enable magnification
defaults write com.apple.dock mineffect -string "scale"          # Set scale effect
defaults write com.apple.dock minimize-to-application -bool true # Enable minimize to application icon
defaults write com.apple.dock show-process-indicators -bool true # Show process indicators
defaults write com.apple.dock show-recents -bool false           # Hide recent application
killall Dock

# Finder
defaults write com.apple.finder FXEnableExtensionsChangeWarning -bool false  # Disable file extension change warning
defaults write com.apple.finder FXPreferredViewStyle Nlsv                    # Set default view to list style
defaults write com.apple.finder NewWindowTarget PfHm                         # Set default path for new finder window to $HOME
defaults write com.apple.finder ShowPathbar -bool true                       # Show path bar
defaults write com.apple.finder ShowRecentTags -bool false                   # Hide tags in sidebar
defaults write com.apple.finder ShowStatusBar -bool true                     # Show status bar
defaults write com.apple.finder SidebarWidth -int 175                        # Greater sidebar width
defaults write com.apple.finder WarnOnEmptyTrash -bool false                 # No warning before emptying trash
defaults write NSGlobalDomain AppleShowAllExtensions -bool true              # Show all file extensions
chflags nohidden ~/Library                                                   # No hidden ~/Library
killall Finder

# Safari
## Couldn't set by SIP from Mojave
## https://github.com/mathiasbynens/dotfiles/issues/849

# Siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool false # Disable Siri
defaults write com.apple.Siri StatusMenuVisible -bool false # Hide icon from menu bar

# Sound
defaults write -g com.apple.sound.beep.feedback -bool true # play feedback when volume changed

# Spotlight
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{enabled = 0; value = {};}" # Disable Spotlight shortcut
defaults write com.apple.assistant.support "Search Queries Data Sharing Status" -int 2                  # Disable query data sharing
defaults delete com.apple.Spotlight "NSStatusItem Visible Item-0"                                       # Hide spotlight icon from menu bar(logout required)

# TextEdit
defaults write com.apple.TextEdit RichText -int 0 # Use plain text mode for new TextEdit documents.
