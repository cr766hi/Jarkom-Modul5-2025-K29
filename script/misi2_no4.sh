#!/bin/bash
# File: misi2_no4.sh
# Jalankan di: IronHills

# 1. Izinkan Subnet Durin (A2) di Sabtu Minggu
iptables -A INPUT -p tcp --dport 80 -s 10.78.1.128/26 -m time --weekdays Sat,Sun -j ACCEPT

# 2. Izinkan Subnet Khamul (A3) di Sabtu Minggu
iptables -A INPUT -p tcp --dport 80 -s 10.78.1.192/29 -m time --weekdays Sat,Sun -j ACCEPT

# 3. Izinkan Subnet Elendil & Isildur (A5) di Sabtu Minggu
iptables -A INPUT -p tcp --dport 80 -s 10.78.0.0/24 -m time --weekdays Sat,Sun -j ACCEPT

# 4. Blokir sisanya
iptables -A INPUT -p tcp --dport 80 -j DROP

echo "Time-based access control configured on IronHills."