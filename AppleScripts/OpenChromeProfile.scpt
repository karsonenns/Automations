activate application "Google Chrome"
tell application "System Events"
	tell process "Google Chrome"
		click menu item "Karson (Felix Karson)" of menu "Profiles" of menu bar 1
        tell application "System Events" to keystroke "m" using {control down}
		return
	end tell
    return
end tell
return