#!/usr/bin/env bash

cd /tmp

wget http://nginx.org/keys/nginx_signing.key

sudo apt-key add /tmp/nginx_signing.key
