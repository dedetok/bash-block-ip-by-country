#!/bin/bash
# 2017-05-23

if [ "$1" != "" ]; then
 echo $1
 # download ipv4 block
 echo "Download ipv4 $1"
 wget http://www.ipdeny.com/ipblocks/data/countries/$1.zone -O zone.ipv4.$1
 # download ipv6 block
 echo "Download ipv6 $1"
 wget http://www.ipdeny.com/ipv6/ipaddresses/blocks/$1.zone -O zone.ipv6.$1
 mfile1="./zone.ipv4.$1"
 ofile1="./ipv4.ipset.$1"
 touch $ofile1
 echo "creating ipset rules $ofile1 for ipv4"
 echo "create ipv4_$1 hash:net" > $ofile1
 while read line; do
  echo "add ipv4_$1 $line" >> $ofile1
 done <"$mfile1"
 echo "Done creating $ofile1"
 mfile2="./zone.ipv6.$1"
 ofile2="./ipv6.ipset.$1"
 echo "creating ipset rules $ofile2 for ipv6"
 echo "create ipv6_$1 hash:net" > $ofile2
 while read line; do
  echo "add ipv6_$1 $line" >> $ofile2
 done <"$mfile2"
 echo "Done creating $ofile2"
else
 echo "Usage .//blockcountryip.sh countrycode2"
fi
