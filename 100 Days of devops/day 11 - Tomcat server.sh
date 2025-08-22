#Install tomcat server
cd /tmp

#copy the files
scp /tmp/ROOT.war tony@stapp01:/tmp

ssh tony@stapp01

#Install Tomcat

sudo yum install tomcat -y

#status 

sudo systemctl restart tomcat

sudo systemctl status tomcat

sudo cp /tmp/ROOT.war /usr/share/tomcat/webapps/

curl http://stapp01:3000