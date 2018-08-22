#!/usr/bin/env bash

FILENAME=/etc/resolv.conf

if [ $(cat $FILENAME | grep -c "nameserver 1.1.1.1") -ne 0 ]; then
	echo "You are already browsing a faster, more private internet."
else
	echo "nameserver 1.1.1.1" | sudo tee -a $FILENAME
fi
