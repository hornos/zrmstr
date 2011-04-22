#!/bin/bash
#/// \file liszt.sh
#/// \brief az OS X alaphangjainak beállítása
#

for d in "Dropbox" "Dropbox.client" "Private" "Private.client" ; do
  _p="${HOME}/${d}"
  if test -d "${_p}" ; then
    chmod -R g-wrx "${_p}"
    chmod -R o-wrx "${_p}"
  fi
done
