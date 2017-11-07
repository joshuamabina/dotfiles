#!/usr/local/env bash

#Add the main repository to sources.list
sudo cp ../sources.list.d/dotdeb.list /etc/apt/sources.list.d/

#Fetch and install the GnuPG key
wget https://www.dotdeb.org/dotdeb.gpg
sudo apt-key add dotdeb.gpg
