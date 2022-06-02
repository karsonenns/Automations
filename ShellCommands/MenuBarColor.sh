#!/bin/zsh -f

BACKGROUND=$(find /Users/karson/Library/Mobile\ Documents/com\~apple\~CloudDocs/Photos/Wallpapers -maxdepth 1 -type f -iname '*.jpg'| gshuf -n 1)
zsh -c "mint run igorkulman/ChangeMenuBarColor SolidColor '$1' '$BACKGROUND'"
rm -f /Users/karson/Library/Application\ Support/ChangeMenuBarColor/*


