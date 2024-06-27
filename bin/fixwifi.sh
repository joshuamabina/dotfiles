#!/usr/bin/env bash

FILENAME=/etc/resolv.conf

if [ $(cat $FILENAME | grep -c "nameserver 1.1.1.1") -ne 0 ]; then
	echo "You are already browsing a faster, more private internet."
else
  # See How do I set my DNS when resolv.conf is being overwritten?
  # https://unix.stackexchange.com/questions/128220/how-do-i-set-my-dns-when-resolv-conf-is-being-overwritten

  # This is temporary until we figure out how DNS resolution works in Ubuntu, step by step

	# echo "nameserver 1.1.1.1" | sudo tee -a $FILENAME

  resolvectl dns 3 1.1.1.1
  resolvectl domain 3 1.1.1.1
  sudo service resolvconf restart
fi

