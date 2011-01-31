#!/bin/bash
URL="http://www.palotai.hu/mixek.html"
PPT="playlist"
for p in \
$(curl -s "${URL}" \
| grep "${PPT}" \
| awk '{gsub(/^.*\('\''/,"");gsub(/'\''.*/,"");print}')
do
  bnp=$(basename "${p%%.html}")
  prev=""
  if test -r "${bnp}/fertig"
  then
    continue
  fi
  if ! test -d "${bnp}" ; then
    mkdir "${bnp}"
  fi
  cd "${bnp}"
  for m in \
  $(curl -s -L "${p}" \
  | grep "mp3\|ogg" \
  | awk '{gsub(/.*href="/,"");gsub(/".*/,"");print}')
  do
    if ! test "${prev}" = "${m}"
    then
      wget -c "${m}"
      prev="${m}"
    fi
    touch "fertig"
  done
  cd ..
done
