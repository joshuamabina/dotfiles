#!/usr/bin/env bash

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev
sudo apt-get install -y libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
sudo apt-get install -y libncurses5-dev libncursesw5-dev xz-utils tk-dev

cd /tmp

wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz
tar xvf Python-3.6.3.tgz
cd Python-3.6.3

./configure --enable-optimizations
make -j8
sudo make altinstall

python3.6
