component_name=cart
source common.sh

#cp cart.service /etc/systemd/system/cart.service
#dnf module disable nodejs -y
#dnf module enable nodejs:20 -y
#dnf install nodejs -y

nodejs


#systemctl daemon-reload
#systemctl enable cart
#systemctl start cart

systemd_setup