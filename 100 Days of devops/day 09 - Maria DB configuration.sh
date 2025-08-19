There is a critical issue going on with the Nautilus application in Stratos DC. The production support team identified that the application is unable to connect to the database. After digging into the issue, the team found that mariadb service is down on the database server.


Look into the issue and fix the same.


sudo mkdir -p /var/lib/mysql
sudo chown -R mysql:mysql /var/lib/mysql
sudo chmod 700 /var/lib/mysql


sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql


sudo systemctl start mariadb
sudo systemctl enable mariadb


sudo systemctl status mariadb
