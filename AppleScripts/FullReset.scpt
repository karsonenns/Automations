-- get list of open apps
tell application "System Events"
	set allApps to displayed name of (every process whose background only is false) as list
end tell

-- MEETING APP PREP
-- leave some apps open 
set exclusions to {"Code"}

##Close and Open Needed Apps
repeat with thisApp in allApps
	## Closes All Apps
	set thisApp to thisApp as text
	if thisApp is not in exclusions then
		tell application thisApp to quit
	end if
end repeat