#!/bin/bash
# File: misi2_no2.sh
# Jalankan di: Vilya

# Blokir ping request yang masuk
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
echo "ICMP echo-request dropped on INPUT."