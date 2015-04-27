#!/bin/bash

amixer -c 1 get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "Mute" } else { print $2"%" }}'
