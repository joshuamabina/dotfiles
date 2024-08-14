#!/bin/bash

# Check if at least two arguments are passed
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 'command1 && command2' dir1 [dir2 ... dirN]"
  exit 1
fi

# The first argument is the commands to run
commands=$1

# The remaining arguments are the directories to watch
shift
directories=$@

# Run the inotifywait loop
while inotifywait -r -e modify,create,delete $directories
do
  eval $commands
done
