#!/usr/bin/env bash

#Heads up! Not tested!

cd /tmp

wget -N \
	https://nodejs.org/dist/v9.0.0/node-v9.0.0-linux-x64.tar.xz


tar -xvf node-v9.0.0-linux-x64.tar.xz

cd node-v9.0.0-linux-x64/

sudo cp -r bin/ /usr/local/ \
	&& cp -r include/ /usr/local/ \
	&& cp -r lib/ /usr/local/ \
	&& cp -r share/ /usr/local/

node --version
npm --version
