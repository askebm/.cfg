#!/bin/bash
while sleep 5; do
if [ $( acpi | sed -E 's/.*:[^0-9]*([0-9]+).*/\1/g' ) -lt 10 ] ; then
	dunstify "$(cowsay GIVE ME POWER!!!)"
	sleep 30
fi
done
