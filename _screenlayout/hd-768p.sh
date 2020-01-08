#!/bin/sh
xrandr --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x768 --rotate normal --output DP-2 --mode 1360x768 --pos 232x0 --rotate normal

nitrogen --restore && killall conky && conky
