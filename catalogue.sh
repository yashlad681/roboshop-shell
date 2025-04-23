component_name=catalogue
source common.sh


#cp catalogue.service /etc/systemd/system/catalogue.service


nodejs
#systemctl daemon-reload
#systemctl enable catalogue
#systemctl start catalogue
cp $(pwd)/mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.yashdevops.online </app/db/master-data.js

systemd_setup