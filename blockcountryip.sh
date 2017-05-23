#!/bin/bash
# Date 2017-05-23
# created by Dedet

if [ "$1" != "" ]; then
 echo $1
 # download ipv4 block
 echo "Download ipv4 $1"
 wget http://www.ipdeny.com/ipblocks/data/countries/$1.zone -O $1.zone.ipv4
 # download ipv6 block
 echo "Download ipv6 $1"
 wget http://www.ipdeny.com/ipv6/ipaddresses/blocks/$1.zone -O $1.zone.ipv6
 mfile1="./$1.zone.ipv4"
 ofile1="./$1.zone.ipv4.ipset"
 touch $ofile1
 echo "creating ipset rules $ofile1 for ipv4"
 echo "create ipv4_$1 hash:net" > $ofile1 
 while read line; do
  echo "add ipv4_$1 $line" >> $ofile1
 done <"$mfile1"
 echo "Done creating $ofile1"
 mfile2="./$1.zone.ipv6"
 ofile2="./$1.zone.ipv6.ipset"
 echo "creating ipset rules $ofile2 for ipv6"
 echo "create ipv6_$1 hash:net" > $ofile2
 while read line; do
  echo "add ipv6_$1 $line" >> $ofile2
 done <"$mfile2"
 echo "Done creating $ofile2" 
else
 echo "Usage .//blockcountryip.sh countrycode2"
fi

