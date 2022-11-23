#!/usr/bin/env bash

Xephyr :1 -ac -dpi 180 -screen 1280x720 &
DISPLAY=:1 awesome start -c config.py
pkill Xephyr
