#!/bin/bash
# File: misi2_no5.sh
# Jalankan di: Palantir

# Shift Pagi di Subnet A6 (Gilgalad & Cirdan) 07:00 - 15:00
iptables -A INPUT -p tcp --dport 80 -s 10.78.1.0/25 -m time --timestart 07:00 --timestop 15:00 -j ACCEPT

# Shift Malam di Subnet A5 (Elendil & Isildur) 17:00 - 23:00
iptables -A INPUT -p tcp --dport 80 -s 10.78.0.0/24 -m time --timestart 17:00 --timestop 23:00 -j ACCEPT

# Blokir Sisanya
iptables -A INPUT -p tcp --dport 80 -j DROP

service nginx start
echo "Shift-based access control configured on Palantir."