dnf install golang -y

cp dispatch.service /etc/systemd/system/dispatch.service

useradd roboshop
rm -rf /app
mkdir /app
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch-v3.zip
cd /app
unzip /tmp/dispatch.zip

cd /app
go mod init dispatch
go get
go build

systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch