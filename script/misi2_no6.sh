#!/bin/bash
# File: misi2_no6.sh
# Jalankan di: Palantir

# Flush Iptables
iptables -F

# A. Jika IP ini sudah ditandai sebagai PORT_SCANNER, blokir dan reset timer 20 detik.
iptables -A INPUT -m recent --name PORT_SCANNER --update -j DROP

# Jika koneksi SYN > 15 kali dalam 20 detik, maka akan dicatat ke LOG.
iptables -A INPUT -p tcp --syn -m recent --name SCAN_COUNT --rcheck --seconds 20 --hitcount 16 -j LOG --log-prefix "PRT_SCAN_DETECTED: " --log-level 4

# Jika koneksi SYN > 15 kali dalam 20 detik, tandai sebagai PORT_SCANNER dan DROP.
iptables -A INPUT -p tcp --syn -m recent --name SCAN_COUNT --rcheck --seconds 20 --hitcount 16 -m recent --name PORT_SCANNER --set -j DROP

# Setiap koneksi baru (SYN) dihitung dalam list SCAN_COUNT.
iptables -A INPUT -p tcp --syn -m recent --name SCAN_COUNT --set

# --- Aturan Shift (dari No 5) tetap diterapkan setelah filter scan ---
# Shift Pagi untuk Subnet A6
iptables -A INPUT -p tcp --dport 80 -s 10.78.1.0/25 -m time --timestart 07:00 --timestop 15:00 -j ACCEPT
# Shift Malam untuk Subnet A5
iptables -A INPUT -p tcp --dport 80 -s 10.78.0.0/24 -m time --timestart 17:00 --timestop 23:00 -j ACCEPT
# Blokir Sisanya
iptables -A INPUT -p tcp --dport 80 -j DROP

echo "Port Scan Detection configured on Palantir."