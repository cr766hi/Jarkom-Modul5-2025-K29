#!/bin/bash
# File: misi3_no1.sh
# Jalankan di: Wilderland

iptables -F FORWARD

# Drop trafik yang masuk dari interface eth2 (arah Khamul) jika MAC address sesuai target
iptables -I FORWARD -i eth2 -m mac --mac-source 02:42:79:29:0c:00 -j DROP

echo "MAC Filtering configured on Wilderland."