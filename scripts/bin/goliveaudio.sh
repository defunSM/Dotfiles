#!/usr/bin/env bash

# Allows audio to be passthrough in discord when going live.
# https://www.reddit.com/r/discordapp/comments/f22vz6/guide_how_to_stream_audio_to_discord_on_linux/
pactl load-module module-null-sink sink_name=Virtual1
pactl load-module module-loopback source=alsa_input.usb-CMTECK_Co._Ltd._CMTECK_000000000000-00.mono-fallback sink=Virtual1.monitor
pactl load-module module-loopback source==alsa_output.pci-0000_0d_00.4.analog-stereo.monitor sink=Virtual1.monitor

pactl load-module module-combine-sink sink_name=nullandmain slaves=alsa_output.pci-0000_0d_00.4.analog-stereo.monitor,Virtual1a
