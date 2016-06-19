#!/bin/bash
yum update -y
yum install -y git
yum install -y httpd
chkconfig httpd on
service httpd start
echo "Smoke test - Success" > /var/www/html/index.html
yum install -y docker
service docker start -u <GitHubUserId> -p <GitHubPassword>
curl -sL https://rpm.nodesource.com/setup | bash -
yum install -y nodejs
npm install forever -g
cd /opt
git clone https://github.com/jdevhari/docker-deployer
cd docker-deployer
npm install
forever start -o out.log listener.js
docker pull jdevhari/spring
docker run --name spring -d -p 8090:8090 jdevhari/spring

#Webhook - http://54.201.104.199:9080/deploy/8090/8090

