#!/bin/sh
# vlc wrapper a sikeres életért
_b_vlc="/Applications/VLC.app/Contents/MacOS/VLC"
exec "./${_b_vlc}" -I dummy $*
