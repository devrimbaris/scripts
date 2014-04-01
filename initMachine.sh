#!/bin/bash

#sudo apt-get -q -y update
#sudo apt-get -q -y upgrade
#sudo apt-get -q -y install git
#git config --global user.name "Masteros Fasteros"
#git config --global user.email devrimbaris@yahoo.com
#sudo apt-get -q -y install emacs
#sudo apt-get -q -y install squid3
home_ip=$(netstat -a |grep .dyn | egrep -oh '88\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}')
#echo  $home_ip

squidLine1="acl home_ip src  $home_ip"
squidLine2="http_access home_ip  allow"
echo $squidLine1 >> /etc/squid3/squid.conf
echo $squidLine2 >> /etc/squid3/squid.conf

