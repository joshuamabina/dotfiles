#!/usr/bin/env bash

cd /tmp

wget -qO - http://nginx.org/keys/nginx_signing.key | sudo apt-key add -
