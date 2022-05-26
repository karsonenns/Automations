do shell script "open -a 'Google Chrome' 'http://meet.google.com/' --args --profile-directory='Profile 9'"

delay 0.2

tell application "Google Chrome"
	tell its window
		set theURL to URL of active tab
		close active tab
	end tell
	set the URL of active tab of (make new window) to theURL
end tell