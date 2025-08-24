kill 441

 netstat -lntp | grep 3001

 systemctl restart httpd

sudo iptables -I INPUT 1 -p tcp --dport 3001 -j ACCEPT