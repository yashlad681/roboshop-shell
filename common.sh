systemd_setup(){
 systemctl daemon-reload
 systemctl enable ${component_name}
 systemctl start ${component_name}
}

nodejs(){
  cp ${component_name}.service /etc/systemd/system/${component_name}.service
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y
  useradd roboshop
  rm -rf /app
  mkdir /app
  cd /app
  npm instal
  curl -L -o /tmp/${component_name}.zip https://roboshop-artifacts.s3.amazonaws.com/${component_name}-v3.zip
  cd /app
  unzip /tmp/${component_name}.zip
  cd /app
  npm install
}

pwd=$(pwd)