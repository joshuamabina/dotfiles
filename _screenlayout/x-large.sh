#!/bin/sh
xrandr --output HDMI-1 --off --output HDMI-1 --off --output DP-1 --mode 2560x1440 --pos 0x0 --rotate normal --output eDP-1 --primary --mode 1920x1080 --pos 320x1440 --rotate normal --output DP-2 --off

nitrogen --restore && killall conky && conky
