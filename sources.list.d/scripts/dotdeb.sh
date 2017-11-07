#!/usr/local/env bash

sudo cp ../dotdeb.list /etc/apt/sources.list.d/

wget -qO https://www.dotdeb.org/dotdeb.gpg | sudo apt-key add -
