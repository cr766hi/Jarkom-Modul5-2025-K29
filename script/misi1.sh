#!/bin/bash
# File: misi1_setup_network.sh
# Jalankan di SEMUA node untuk konfigurasi IP dan Routing otomatis berdasarkan Hostname.

HOSTNAME=$(hostname)

echo "Konfigurasi Network untuk: $HOSTNAME"
echo "nameserver 192.168.122.1" > /etc/resolv.conf

case "$HOSTNAME" in
    "Osgiliath")
        ip addr add 192.168.122.1 dev eth0 
        ip addr add 10.78.1.233/30 dev eth1
        ip addr add 10.78.1.229/30 dev eth2
        ip addr add 10.78.1.237/30 dev eth3
        ip route add default via 192.168.122.1 dev eth0
        
        # Routing Table
        ip route add 10.78.1.232/30 via 10.78.1.234 dev eth1
        ip route add 10.78.1.200/29 via 10.78.1.234 dev eth1
        ip route add 10.78.1.228/30 via 10.78.1.230 dev eth2
        ip route add 10.78.1.208/30 via 10.78.1.230 dev eth2
        ip route add 10.78.1.212/30 via 10.78.1.230 dev eth2
        ip route add 10.78.1.128/26 via 10.78.1.230 dev eth2
        ip route add 10.78.1.192/29 via 10.78.1.230 dev eth2
        ip route add 10.78.1.236/30 via 10.78.1.238 dev eth3
        ip route add 10.78.0.0/24 via 10.78.1.238 dev eth3
        ip route add 10.78.1.224/30 via 10.78.1.238 dev eth3
        ip route add 10.78.1.216/30 via 10.78.1.238 dev eth3
        ip route add 10.78.1.220/30 via 10.78.1.238 dev eth3
        ip route add 10.78.1.0/25 via 10.78.1.238 dev eth3
        
        iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.122.35
        ;;

    "Rivendell")
        ip addr add 10.78.1.234/30 dev eth0
        ip addr add 10.78.1.201/29 dev eth1
        ip route add default via 10.78.1.233 dev eth0
        
        # Routes
        ip route add 10.78.1.232/30 via 10.78.1.233
        ip route add 10.78.1.228/30 via 10.78.1.233
        ip route add 10.78.1.208/30 via 10.78.1.233
        ip route add 10.78.1.212/30 via 10.78.1.233
        ip route add 10.78.1.128/26 via 10.78.1.233
        ip route add 10.78.1.192/29 via 10.78.1.233
        ip route add 10.78.1.236/30 via 10.78.1.233
        ip route add 10.78.0.0/24 via 10.78.1.233
        ip route add 10.78.1.224/30 via 10.78.1.233
        ip route add 10.78.1.216/30 via 10.78.1.233
        ip route add 10.78.1.220/30 via 10.78.1.233
        ip route add 10.78.1.0/25 via 10.78.1.233
        ;;

    "Narya")
        ip addr add 10.78.1.202/29 dev eth0
        ip route add default via 10.78.1.201 dev eth0
        ;;

    "Vilya")
        ip addr add 10.78.1.203/29 dev eth0
        ip route add default via 10.78.1.201 dev eth0
        ;;

    "Moria")
        ip addr add 10.78.1.230/30 dev eth0
        ip addr add 10.78.1.209/30 dev eth1
        ip addr add 10.78.1.213/30 dev eth2
        ip route add default via 10.78.1.229 dev eth0
        
        # Routes
        ip route add 10.78.1.228/30 via 10.78.1.229
        ip route add 10.78.1.212/30 via 10.78.1.214
        ip route add 10.78.1.128/26 via 10.78.1.214
        ip route add 10.78.1.192/29 via 10.78.1.214
        ip route add 10.78.1.232/30 via 10.78.1.229
        ip route add 10.78.1.200/29 via 10.78.1.229
        ip route add 10.78.1.236/30 via 10.78.1.229
        ip route add 10.78.0.0/24 via 10.78.1.229
        ip route add 10.78.1.224/30 via 10.78.1.229
        ip route add 10.78.1.216/30 via 10.78.1.229
        ip route add 10.78.1.220/30 via 10.78.1.229
        ip route add 10.78.1.0/25 via 10.78.1.229
        ;;

    "IronHills")
        ip addr add 10.78.1.210/30 dev eth0
        ip route add default via 10.78.1.209 dev eth0
        ;;

    "Wilderland")
        ip addr add 10.78.1.214/30 dev eth0
        ip addr add 10.78.1.129/26 dev eth1
        ip addr add 10.78.1.193/29 dev eth2
        ip route add default via 10.78.1.213 dev eth0
        
        # Routes
        ip route add 10.78.1.212/30 via 10.78.1.213
        ip route add 10.78.1.208/30 via 10.78.1.213
        ip route add 10.78.1.228/30 via 10.78.1.213
        ip route add 10.78.1.232/30 via 10.78.1.213
        ip route add 10.78.1.200/29 via 10.78.1.213
        ip route add 10.78.1.236/30 via 10.78.1.213
        ip route add 10.78.0.0/24 via 10.78.1.213
        ip route add 10.78.1.224/30 via 10.78.1.213
        ip route add 10.78.1.216/30 via 10.78.1.213
        ip route add 10.78.1.220/30 via 10.78.1.213
        ip route add 10.78.1.0/25 via 10.78.1.213
        ;;

    "Durin")
        ip addr add 10.78.1.130/26 dev eth0
        ip route add default via 10.78.1.129 dev eth0
        ;;

    "Khamul")
        ip addr add 10.78.1.194/29 dev eth0
        ip route add default via 10.78.1.193 dev eth0
        ;;

    "Minastir")
        ip addr add 10.78.1.238/30 dev eth0
        ip addr add 10.78.0.1/24 dev eth1
        ip addr add 10.78.1.225/30 dev eth2
        ip route add default via 10.78.1.237 dev eth0
        
        # Routes
        ip route add 10.78.1.236/30 via 10.78.1.237
        ip route add 10.78.1.232/30 via 10.78.1.237
        ip route add 10.78.1.200/29 via 10.78.1.237
        ip route add 10.78.1.228/30 via 10.78.1.237
        ip route add 10.78.1.208/30 via 10.78.1.237
        ip route add 10.78.1.212/30 via 10.78.1.237
        ip route add 10.78.1.128/26 via 10.78.1.237
        ip route add 10.78.1.192/29 via 10.78.1.237
        ip route add 10.78.1.224/30 via 10.78.1.226
        ip route add 10.78.1.216/30 via 10.78.1.226
        ip route add 10.78.1.220/30 via 10.78.1.226
        ip route add 10.78.1.0/25 via 10.78.1.226
        ;;

    "Elendil")
        ip addr add 10.78.0.2/24 dev eth0
        ip route add default via 10.78.0.1 dev eth0
        ;;

    "Isildur")
        ip addr add 10.78.0.3/24 dev eth0
        ip route add default via 10.78.0.1 dev eth0
        ;;

    "Pelargir")
        ip addr add 10.78.1.226/30 dev eth0
        ip addr add 10.78.1.217/30 dev eth1
        ip addr add 10.78.1.221/30 dev eth2
        ip route add default via 10.78.1.225 dev eth0
        
        # Routes
        ip route add 10.78.1.236/30 via 10.78.1.225
        ip route add 10.78.1.232/30 via 10.78.1.225
        ip route add 10.78.1.200/29 via 10.78.1.225
        ip route add 10.78.1.228/30 via 10.78.1.225
        ip route add 10.78.1.208/30 via 10.78.1.225
        ip route add 10.78.1.212/30 via 10.78.1.225
        ip route add 10.78.1.128/26 via 10.78.1.225
        ip route add 10.78.1.192/29 via 10.78.1.225
        ip route add 10.78.1.224/30 via 10.78.1.225
        ip route add 10.78.0.0/24 via 10.78.1.225
        ip route add 10.78.1.220/30 via 10.78.1.222
        ip route add 10.78.1.0/25 via 10.78.1.222
        ;;

    "Palantir")
        ip addr add 10.78.1.218/30 dev eth0
        ip route add default via 10.78.1.217 dev eth0
        ;;

    "AnduinBanks")
        ip addr add 10.78.1.222/30 dev eth0
        ip addr add 10.78.1.1/25 dev eth1
        ip route add default via 10.78.1.221 dev eth0
        
        # Routes
        ip route add 10.78.1.236/30 via 10.78.1.221
        ip route add 10.78.1.232/30 via 10.78.1.221
        ip route add 10.78.1.200/29 via 10.78.1.221
        ip route add 10.78.1.228/30 via 10.78.1.221
        ip route add 10.78.1.208/30 via 10.78.1.221
        ip route add 10.78.1.212/30 via 10.78.1.221
        ip route add 10.78.1.128/26 via 10.78.1.221
        ip route add 10.78.1.192/29 via 10.78.1.221
        ip route add 10.78.1.224/30 via 10.78.1.221
        ip route add 10.78.0.0/24 via 10.78.1.221
        ip route add 10.78.1.224/30 via 10.78.1.221
        ip route add 10.78.1.216/30 via 10.78.1.221
        ;;

    "Cirdan")
        ip addr add 10.78.1.2/25 dev eth0
        ip route add default via 10.78.1.1 dev eth0
        ;;

    "Gilgalad")
        ip addr add 10.78.1.3/25 dev eth0
        ip route add default via 10.78.1.1 dev eth0
        ;;

    *)
        echo "Hostname tidak dikenali: $HOSTNAME"
        ;;
esac