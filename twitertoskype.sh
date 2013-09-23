#/bin/sh
userid=$1
message=`curl -s https://twitter.com/$userid | sed -e '/<p class="js-tweet-text tweet-text">/!d' | sed -n '/^$/!{s/<[^>]*>//g;p;}' | sed 's/^[ ]*//' | head -n 1`
bool=`osascript -e "tell application \"System Events\" to set isRunning to count processes whose name is \"Skype\""`
echo $message
if [ "$bool" -gt 0 ]; then
osascript -e "tell application \"Skype\" to send command \"SET PROFILE MOOD_TEXT $message\" script name \"IMStatus\""
fi