/usr/bin/osascript <<EOF >>/dev/null
tell application "System Events"
    activate
    display dialog "Let's take a break!" buttons {"OK"} with title "('e')"
end tell
EOF
