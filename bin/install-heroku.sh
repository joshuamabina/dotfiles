#!/usr/bin/env bash

#Download and install heroku-cli
wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

#Always use heroku with ssh on this machine
git config --global url.ssh://git@heroku.com/.insteadOf https://git.heroku.com/

#Add ssh-keys to heroku
heroku keys:add
