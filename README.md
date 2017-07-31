# bash-block-ip-by-country
This bash script will 
1. Download block ip by country from http://www.ipdeny.com
2. Convert block ip into ipset format

For IPV4: http://www.ipdeny.com/ipblocks/data/countries/
For IPV6: http://www.ipdeny.com/ipv6/ipaddresses/blocks/

To run:
# ./blockcountryip.sh [countrycode]
For Example for China (CN)
## ./blockcountryip.sh cn

To load it in memory 
# ipset restore < ipv4.ipset.[countrycode]

[countrycode] is 2 character country code https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2 

To apply in iptables
# iptables -A INPUT -p tcp -m multiport --dports [any port you wish] -m set --match-set ipv4_[countrycode] src -j DROP
For example to block all IPV4 from China for port 21,22,80, 443, and 2222
# iptables -A INPUT -p tcp -m multiport --dports 21,22,80,443,2222 -m set --match-set ipv4_cn src -j DROP
# iptables -A INPUT -p udp -m multiport --dports 22,2222 -m set --match-set ipv4_cn src -j DROP
To block all connection from China
# iptables -A INPUT -m set --match-set ipv4_cn src -j DROP

To make it persistent, follow your distribution guide how to load ipset and iptables rules everytime system start/restart or network start/restart.

Not Working
IPV6
