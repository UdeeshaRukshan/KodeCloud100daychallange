sudo su -

cd /temp

yum install nginx -y

systemctl start nginx

cd /etc/pki

cd tls

cd certs

mv /tmp/nautilus.crt /etc/pki/tls/certs
mv /tmp/nautilus.key /etc/pki/tls/private/

cd /etc/nginx/

vi nginx.conf

systemctl restart nginx

rm -rf index.html

vi index.html

ngint -t #to see any errors