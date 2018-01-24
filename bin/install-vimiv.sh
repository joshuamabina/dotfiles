#!/usr/bin/env bash

sudo apt-get install -y python3 python-gobject python-gobject-dev libgtk-3-0 libgtk-3-dev \
	python3-setuptools python-dev libgexiv2-2 libgexiv2-dev

cd /tmp

git clone git@github.com:karlch/vimiv.git -b v0.9.1

cd vimiv

make install
