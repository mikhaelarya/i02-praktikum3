apt-get update
apt-get install bind9 -y

sleep 1

echo 'zone "i02.com" {
	type master;
	file "/etc/bind/i02/i02.com";
};' | tee -a /etc/bind/named.conf.local

sleep 1

mkdir -p /etc/bind/i02

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@         IN      SOA     i02.com. root.i02.com. (
                     2023101001         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@         IN      NS      i02.com.
@         IN      A       192.229.1.3
www       IN      CNAME   i02.com.
@         IN      AAAA    ::1
;
;
riegel.canyon    IN      A       192.229.4.2
riegel.canyon    IN      A       192.229.4.3
riegel.canyon    IN      A       192.229.4.4

' | tee /etc/bind/i02/i02.com

echo 'options {
    directory "/var/cache/bind";

    forwarders {
        192.168.122.1;
    };
    allow-query{ any; };
    listen-on-v6 { any; };

};' | tee /etc/bind/named.conf.options


service bind9 restart