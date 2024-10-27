#!/bin/bash

vncserver $DISPLAY -geometry 1280x800 -depth 24
while ! pgrep -x "Xtightvnc" >/dev/null; do sleep 1; done
websockify ${NOVNC_PORT} localhost:${VNC_PORT}
