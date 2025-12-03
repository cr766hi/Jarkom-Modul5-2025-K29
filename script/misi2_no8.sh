#!/bin/bash
# File: misi2_no8.sh
# Jalankan di: Moria

# Redirect trafik dari Vilya (10.78.1.203) yang menuju Khamul (10.78.1.196?? - Cek IP Khamul yg valid dari DHCP lease, asumsi soal benar) port 5555 ke IronHills:5555
# Note: IP Destinasi (Khamul) mungkin berubah karena DHCP, pastikan IP sesuai soal/kondisi lapangan.
iptables -t nat -A PREROUTING -s 10.78.1.203 -d 10.78.1.196 -p tcp --dport 5555 -j DNAT --to-destination 10.78.1.210:5555

echo "DNAT redirection configured on Moria."