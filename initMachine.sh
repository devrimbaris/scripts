#!/bin/bash

#sudo apt-get -q -y update
#sudo apt-get -q -y upgrade
#git config --global user.name "Masteros Fasteros"
#git config --global user.email devrimbaris@yahoo.com
#sudo apt-get -q -y install emacs
sudo apt-get -q -y install squid3
#detect home ip address
home_ip=$(netstat -a |grep .dyn | egrep -oh '88\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}' |head -1)

#reconfigure squid to allow my home ip adress
squidLine1="acl home_ip src  $home_ip"
squidLine2="http_access allow home_ip"
echo $squidLine1 >> /etc/squid3/squid.conf
echo $squidLine2 >> /etc/squid3/squid.conf

/etc/init.d/squid3 restart
