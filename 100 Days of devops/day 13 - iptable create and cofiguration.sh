
yum install iptables-services -y

iptables -L -n

iptables -A INPUT -p tcp --dport 5002 -s stlb01 -j ACCEPT

service iptables save

iptables -D INPUT 3
