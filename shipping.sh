set -e

if [ -z "$1" ]; then
  echo Input DB pass is missing
  exit
fi

component_name=shipping
source common.sh

java


dnf install mysql -y

for file in schema app-user master-data; do
  mysql -h mysql-dev.yashdevops.online -uroot -p$1 < /app/db/$file.sql
done

#mysql -h mysql-dev.yashdevops.online -uroot -pRoboShop@1 < /app/db/schema.sql
#mysql -h mysql-dev.yashdevops.online -uroot -pRoboShop@1 < /app/db/app-user.sql
#mysql -h mysql-dev.yashdevops.online -uroot -pRoboShop@1 < /app/db/master-data.sql

systemd_setup

#RoboShop@1