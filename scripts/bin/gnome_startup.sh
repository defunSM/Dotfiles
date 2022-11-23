#!/usr/bin/env bash

# Gnome startup applications

if $XDG_CURRENT_DESKTOP == 'GNOME':

   # Starting redshift getting the geolocation
   redshift -l $(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | jq -r '"\(.location.lat):\(.location.lng)"') &
