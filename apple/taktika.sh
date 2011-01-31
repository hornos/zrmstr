#!/bin/bash

echo "Finder"
defaults write com.apple.finder QLHidePanelOnDeactivate 0
killall Finder

echo "Dock"
defaults write com.apple.dashboard mcx-disabled -boolean true
killall Dock
