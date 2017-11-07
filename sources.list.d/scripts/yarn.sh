#!/usr/bin/env bash

sudo cp ../yarn.list /etc/apt/sources.list.d/

wget -qO https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
