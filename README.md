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

Download IPSET IPV4 

Rusia http://www.garasiku.web.id/ipv4.ipset.ru 
US http://www.garasiku.web.id/ipv4.ipset.us
Korea http://www.garasiku.web.id/ipv4.ipset.kr
China http://www.garasiku.web.id/ipv4.ipset.cn

Not Working
IPV6

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
