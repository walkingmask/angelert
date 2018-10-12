#!/usr/bin/env bash
set -eux


#
# Uninstall angelert from launchd
#


if launchctl list | grep angelert >/dev/null 2>&1; then
  launchctl stop angelert
  launchctl unload $HOME/Library/LaunchAgents/angelert.plist
fi

if [ -f $HOME/Library/LaunchAgents/angelert.plist ]; then
  rm $HOME/Library/LaunchAgents/angelert.plist
fi
