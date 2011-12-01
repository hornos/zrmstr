#!/bin/bash
#/// \file palotai.sh
#/// \brief Letölti az összes tutiságot Szt. Palotai oldaláról
#///
#/// TODO: playlist dl as id3 message and cue
url="http://www.palotai.hu/mixek.html"
ppt="playlist"
out="palotai.m3u"

# args
while getopts vu:p: opt; do
  case "$opt" in
    u) url=$OPTARG;;
    p) ppt=$OPTARG;;
    v) _v="-v";;
  esac
done

d=$(date)
echo "# ${d}" > "${out}"
for p in \
$(wget -qO- "${url}" \
| grep "${ppt}" \
| awk '{gsub(/^.*\('\''/,"");gsub(/'\''.*/,"");print}')
do
  i=0
  marr=()
  echo
  echo "Playlist: $p"
  bnp=$(basename "${p%%.html}")
  for m in \
  $(wget -qO- "${p}" \
  | grep "\.mp3\|\.ogg" \
  | awk '{gsub(/.*href="/,"");gsub(/".*/,"");print}')
  do
    if ! test "${marr[${i}]}" = "${m}" ; then
      echo "Data: $m"
      echo "${m}" >> "${out}"
      i=$((i+1))
      marr[${i}]="${m}"
    fi
  done
done
