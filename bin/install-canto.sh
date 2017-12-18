#!/usr/bin/env bash
#Website: https://codezen.org/canto-ng/

sudo apt-get install -y python3 python3-dev python3-feedparser

cd /tmp

#clone the latest release (v0.9.7)
git clone https://github.com/themoken/canto-next.git -b v0.9.7 --depth=1

cd canto-next
sudo python3 setup.py install

cd ../

#clone the latest release (v0.9.9)
git clone https://github.com/themoken/canto-curses.git -b v0.9.9 --depth=1

cd canto-curses
sudo python3 setup.py install
