#!/usr/bin/env bash

sudo apt-get install libevent-dev

cd /tmp

git clone git@github.com:tmux/tmux.git --depth=1 2> /dev/null

cd tmux

bash autogen.sh

sudo auto-apt run ./configure && make

sudo checkinstall
