#!/usr/bin/env bash

key="$1"

cat ~/logins | grep $key | cut -d ':' -f2 | xclip -sel c
