-- get list of open apps
tell application "System Events"
	set allApps to displayed name of (every process whose background only is false) as list
end tell

-- MEETING APP PREP
-- leave some apps open 
set debugApps to {"Script Editor", "Script Debugger"}
set dontCloseButOpen to {"Spotify", "Google Chrome", "Moom", "Bear", "Notion", "Slack"}
set exclusions to {"Code", "Warp"}

##Close and Open Needed Apps
repeat with thisApp in allApps
	## Closes All Apps
	set thisApp to thisApp as text
	if thisApp is not in dontCloseButOpen & debugApps & exclusions then
		tell application thisApp
			quit
		end tell
	end if
end repeat