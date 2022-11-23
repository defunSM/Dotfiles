#!/usr/bin/sh
# only add floating scratchpad window node id to /tmp/scratchid
bspc query -N -n .floating | xargs -i sh -c 'bspc query  --node {} -T | grep -q scratchpad && echo {} > /tmp/scratchid'
exec $SHELL
