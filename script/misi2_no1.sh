#!/bin/bash
# File: misi1_no4_services.sh

HOSTNAME=$(hostname)
apt-get update

if [ "$HOSTNAME" == "Vilya" ]; then
    # --- DHCP SERVER ---
    echo "Configuring DHCP Server on Vilya..."
    apt-get install isc-dhcp-server -y
    
    echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server
    
    cat > /etc/dhcp/dhcpd.conf <<EOF
default-lease-time 600;
max-lease-time 7200;
option domain-name-servers 10.78.1.202; 

subnet 10.78.1.200 netmask 255.255.255.248 {}

subnet 10.78.1.128 netmask 255.255.255.192 {
    range 10.78.1.131 10.78.1.190;
    option routers 10.78.1.129;
    option broadcast-address 10.78.1.191;
}

subnet 10.78.1.192 netmask 255.255.255.248 {
    range 10.78.1.195 10.78.1.198;
    option routers 10.78.1.193;
    option broadcast-address 10.78.1.199;
}

subnet 10.78.0.0 netmask 255.255.255.0 {
    range 10.78.0.10 10.78.0.254;
    option routers 10.78.0.1;
    option broadcast-address 10.78.0.255;
}

subnet 10.78.1.0 netmask 255.255.255.128 {
    range 10.78.1.10 10.78.1.126;
    option routers 10.78.1.1;
    option broadcast-address 10.78.1.127;
}
EOF
    service isc-dhcp-server restart

elif [[ "$HOSTNAME" == "Rivendell" || "$HOSTNAME" == "AnduinBanks" || "$HOSTNAME" == "Minastir" ]]; then
    # --- DHCP RELAY (2 Interfaces) ---
    echo "Configuring DHCP Relay on $HOSTNAME..."
    apt-get install isc-dhcp-relay -y
    
    cat > /etc/default/isc-dhcp-relay <<EOF
SERVERS="10.78.1.203"
INTERFACES="eth0 eth1"
OPTIONS=""
EOF
    echo 1 > /proc/sys/net/ipv4/ip_forward
    service isc-dhcp-relay restart

elif [[ "$HOSTNAME" == "Wilderland" ]]; then
    # --- DHCP RELAY (3 Interfaces) ---
    echo "Configuring DHCP Relay on Wilderland..."
    apt-get install isc-dhcp-relay -y
    
    cat > /etc/default/isc-dhcp-relay <<EOF
SERVERS="10.78.1.203"
INTERFACES="eth0 eth1 eth2"
OPTIONS=""
EOF
    echo 1 > /proc/sys/net/ipv4/ip_forward
    service isc-dhcp-relay restart

elif [[ "$HOSTNAME" == "Narya" ]]; then
    # --- DNS SERVER ---
    echo "Configuring DNS Server on Narya..."
    apt-get install bind9 -y
    
    cat > /etc/bind/named.conf.options <<EOF
options {
        directory "/var/cache/bind";
        allow-query { any; };
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
EOF

    cat > /etc/bind/named.conf.local <<EOF
zone "middleearth.local" {
    type master;
    file "/etc/bind/db.middleearth";
};
EOF

    cat > /etc/bind/db.middleearth <<EOF
;
; BIND data file for local loopback interface
;
\$TTL    604800
@       IN      SOA     middleearth.local. root.middleearth.local. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      middleearth.local.
@       IN      A       10.78.1.202   ; IP Narya sendiri
; Record Web Server
ironhills    IN       A       10.78.1.210
palantir     IN       A       10.78.1.218
EOF
    service named restart

elif [[ "$HOSTNAME" == "IronHills" || "$HOSTNAME" == "Palantir" ]]; then
    # --- WEB SERVER ---
    echo "Configuring Web Server on $HOSTNAME..."
    apt-get install nginx -y
    echo "Welcome to $HOSTNAME" > /var/www/html/index.html
    service nginx start

else
    echo "Node ini tidak memerlukan konfigurasi Service (DHCP/DNS/Web) atau konfigurasi dilakukan manual (Client)."
fi