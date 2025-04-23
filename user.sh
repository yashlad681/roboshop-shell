component_name=user
source common.sh

#cp user.service /etc/systemd/system/user.service

nodejs

systemd_setup
#systemctl daemon-reload
#systemctl enable user
#systemctl start user