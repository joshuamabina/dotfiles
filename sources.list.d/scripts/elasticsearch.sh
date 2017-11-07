#!/usr/bin/env bash

sudo cp ../elasticsearch.list /etc/apt/sources.list.d/

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
