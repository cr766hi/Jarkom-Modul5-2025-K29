#!/bin/bash
# File: misi2_no3.sh
# Jalankan di: Narya

# Install netcat dulu untuk testing (opsional di script ini, tapi diminta di soal)
apt-get update && apt-get install netcat-openbsd -y

# Izinkan Vilya (10.78.1.203) akses UDP 53
iptables -A INPUT -p udp --dport 53 -s 10.78.1.203 -j ACCEPT

# Tolak sisanya
iptables -A INPUT -p udp --dport 53 -j REJECT

echo "DNS Security configured (Only Vilya allowed)."