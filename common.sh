pwd=$(pwd)
systemd_setup(){
   cp $(pwd)/${component_name}.service /etc/systemd/system/${component_name}.service
 systemctl daemon-reload
 systemctl enable ${component_name}
 systemctl start ${component_name}
}

app_pre_setup(){
useradd roboshop
  rm -rf /app
  mkdir /app
  cd /app
  npm install
  curl -L -o /tmp/${component_name}.zip https://roboshop-artifacts.s3.amazonaws.com/${component_name}-v3.zip
#  cd /app
  unzip /tmp/${component_name}.zip

}

nodejs(){
#  cp ${component_name}.service /etc/systemd/system/${component_name}.service
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y

app_pre_setup

  npm install
}



python() {
  dnf install python3 gcc python3-devel -y
#  cp payment.service /etc/systemd/system/payment.service
 app_pre_setup

  pip3 install -r requirements.txt
}

java(){
  dnf install maven -y
app_pre_setup

  mvn clean package
  mv target/${component_name}-1.0.jar ${component_name}.jar
}