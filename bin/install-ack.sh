#!/usr/bin/env bash

sudo apt-get install ack-grep

#ack-grep is 167% more characters to type per invocation
#renaming ack-grep to ack by creating a local diversion

sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
