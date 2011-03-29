#!/bin/bash
#/// \file palotai.sh
#/// \brief Letölti az összes tutiságot Szt. Palotai oldaláról
#///
#/// TODO: playlist dl as id3 message and cue
url="http://www.palotai.hu/mixek.html"
ppt="playlist"
_ok=".ready"
_v=""

# args
while getopts vu:p: opt; do
  case "$opt" in
    u) url=$OPTARG;;
    p) ppt=$OPTARG;;
    v) _v="-v";;
  esac
done


for p in \
$(curl -s "${url}" \
| grep "${ppt}" \
| awk '{gsub(/^.*\('\''/,"");gsub(/'\''.*/,"");print}')
do
  bnp=$(basename "${p%%.html}")
  prev=""
  if test -r "${bnp}/${_ok}"
  then
    continue
  fi
  if ! test -d "${bnp}" ; then
    mkdir ${_v} "${bnp}"
  fi
  cd "${bnp}"
  for m in \
  $(curl -s -L "${p}" \
  | grep "mp3\|ogg" \
  | awk '{gsub(/.*href="/,"");gsub(/".*/,"");print}')
  do
    if ! test "${prev}" = "${m}"
    then
      wget ${_v} -c "${m}"
      prev="${m}"
    fi
    touch "${_ok}"
  done
  cd ..
done
