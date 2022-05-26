#!/bin/zsh -f

# Important! DIR _must_ be the same as whatever directory you used
# for `QueueDirectories` in the `com.tjluoma.IgnitionAtWork.plist`
DIR="/Users/karson/Dropbox/IFTTT/"

    # if the directory does not exist, exit
cd "$DIR" || exit 0

    # get rid of this file, which will cause `launchd` to keep triggering
rm -f .DS_Store

command ls -1 \
| egrep 'GoogleHomeOn|GoogleHomeOff' \
| while read line
do

case "$line" in
    GoogleHomeOn*)

        ###########################################################################
        ## BEGIN OPTIONAL SECTION for when Ignition is turned on

        if grep -q "break" "$line"; then
            afplay '/System/Library/Sounds/Hero.aiff'
        elif grep -q "meeting" "$line"; then
            afplay '/System/Library/Sounds/Hero.aiff'
        else
            afplay '/System/Library/Sounds/Purr.aiff'
        fi

        # bunch GoogleHomeOn

        ## END OPTIONAL SECTION for when Ignition is turned on
        ###########################################################################

            # This deletes the file so that launchd doesn't just keep triggering the script
        rm -f "$line"
    ;;

    GoogleHomeOff*)

        if grep -q "break" "$line"; then
            afplay '/System/Library/Sounds/Hero.aiff'
        elif grep -q "meeting" "$line"; then

        else
            afplay '/System/Library/Sounds/Purr.aiff'
        fi
        
        rm -f "$line"
    ;;

esac

done

exit 0
# End of shell script