systemd_setup(){
 systemctl daemon-reload
 systemctl enable ${component_name}
 systemctl start ${component_name}
}

nodejs(){
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y
}