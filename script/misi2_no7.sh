#!/bin/bash
# File: misi2_no7.sh
# Jalankan di: IronHills

iptables -F

# Limit akses hingga 3 koneksi dalam waktu yang bersamaan
iptables -A INPUT -p tcp --dport 80 -m connlimit --connlimit-above 3 --connlimit-mask 32 -j REJECT --reject-with tcp-reset

# --- Aturan Akses Waktu (Dari No 4) ---
# Subnet Durin (A2)
iptables -A INPUT -p tcp --dport 80 -s 10.78.1.128/26 -m time --weekdays Sat,Sun -j ACCEPT

# Subnet Khamul (A3)
iptables -A INPUT -p tcp --dport 80 -s 10.78.1.192/29 -m time --weekdays Sat,Sun -j ACCEPT

# Subnet Elendil & Isildur (A5)
iptables -A INPUT -p tcp --dport 80 -s 10.78.0.0/24 -m time --weekdays Sat,Sun -j ACCEPT

# Blokir Sisanya
iptables -A INPUT -p tcp --dport 80 -j DROP

echo "Connection limiting configured on IronHills."