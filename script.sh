#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
EC2AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
echo '<center><h1>This Amzon EC2 instace is ocated in AZ: AZID </h1></center>' > /var/www/html/index.txt
sed "s/AZID/$EC2AZ/g" /var/www/html/index.txt > /var/www/html/index.html