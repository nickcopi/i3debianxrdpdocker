#!/bin/sh
printf "%s\n%s" $RDP_PASS $RDP_PASS | passwd user
xrdp
xrdp-sesman
while true; do sleep 12 ; done
