#!/usr/bin/env bash

sudo apt-get install ack-grep

#ack-grep is 167% more characters to type per invocation
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

which ack && ack --version
