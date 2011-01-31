#!/bin/bash

SOX=sox
OPTS="-V3"

inp="${1:-input.wav}"
out="${inp%%wav}aiff"
sdir="${HOME}/Library/Sounds"

p_out="${sdir}/${out}"

if test -r "${p_out}" ; then
  exit 1
fi

${SOX} ${OPTS} "${inp}" "${p_out}"
