#!/usr/bin/env bash
set -eux


#
# Install angelert with launchd
#


SCRIPT_PATH=$HOME/bin
if [ -f $SCRIPT_PATH/angelert.sh ]; then
  rm $SCRIPT_PATH/angelert.sh
fi
cp ./angelert.sh $SCRIPT_PATH/

if [ -f $HOME/Library/LaunchAgents/angelert.plist ]; then
  rm $HOME/Library/LaunchAgents/angelert.plist
fi
sed -e "s|SCRIPT_PATH|$SCRIPT_PATH|g" ./angelert.plist >$HOME/Library/LaunchAgents/angelert.plist

if launchctl list | grep angelert >/dev/null 2>&1; then
  launchctl stop angelert
  launchctl unload $HOME/Library/LaunchAgents/angelert.plist
fi
launchctl load $HOME/Library/LaunchAgents/angelert.plist
launchctl start angelert
