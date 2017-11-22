#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y libnss3-tools dnsmasq jq
composer global require cpriego/valet-linux

valet install

valet domain .local

sudo apt-get autoremove
sudo apt-get autoclean
