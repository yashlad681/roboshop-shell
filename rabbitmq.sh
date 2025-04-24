if [ -z "$1" ]; then
  echo Input password is missing
  exit
fi

cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo
dnf install rabbitmq-server -y


rabbitmqctl add_user roboshop $1
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"

systemctl enable rabbitmq-server
systemctl start rabbitmq-server

#roboshop123