# bash-block-ip-by-country
This bash script will 
1. Download block ip by country from http://www.ipdeny.com
2. Convert block ip into ipset format

For IPV4: http://www.ipdeny.com/ipblocks/data/countries/
For IPV6: http://www.ipdeny.com/ipv6/ipaddresses/blocks/

To run:
# ./blockcountryip.sh [countrycode]
For Example for China (CN)
# ./blockcountryip.sh cn

To load it in memory 
# ipset restore < [countrycode].zone.ipv4.ipset

[countrycode] is 2 character country code https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2 

To apply in iptables
# iptables -A INPUT -p tcp -m multiport --dports [any port you wish] -m set --match-set ipv4_[countrycode] src -j DROP
For example to block all IPV4 from China for port 21,22,25,80 and 443
# iptables -A INPUT -p tcp -m multiport --dports 21,22,25,80,443 -m set --match-set ipv4_cn src -j DROP

To make it persistent, follow your distribution guide how to load ipset and iptables rules everytime system start/restart or network start/restart.

Not Working
IPV6
