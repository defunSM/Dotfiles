#!/usr/bin/env bash

Xephyr :1 -ac -dpi 180 -screen 1280x720 &
DISPLAY=:1 qtile start -c config.py
pkill Xephyr
