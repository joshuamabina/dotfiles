#!/bin/zsh

# Increase the amount of inotify watches
# Learn about inotify https://manpage.me/?q=inotify
# See https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers

echo 99999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
echo 99999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events
echo 99999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances

# Remove all watches and associated triggers.
# See https://facebook.github.io/watchman/docs/cmd/watch-del-all.html

watchman watch-del-all

# Clean Install

npm ci
