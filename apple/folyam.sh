#!/bin/bash
# alapértelmezett icecast2 folyam újraértelmezése
# azért, hogy az itunes-t, mint airtunes klienst
# ki lehessen használni
_b_vlc="vlc.sh -vvv"
_src=127.0.0.1:8000/stream
_dst=127.0.0.1:8080
${_b_vlc} --sout "#transcode{acodec=mp3,ab=256}:standard{access=http,mux=raw,dst=${_dst}}" http://${_src}
