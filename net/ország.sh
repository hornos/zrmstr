#!/bin/bash

url="http://www.find-ip-address.org/ip-country/index.php"

country="${1:-HU}"
type="${2:-cidr}"
out="${country}.${type}"
wget -qO- --post-data "country=${country}&prefix=&output=${type}" "${url}" > "${out}"
