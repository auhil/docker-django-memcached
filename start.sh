#!/bin/bash

docker kill $(docker ps -a|grep auhil|awk '{print $1}')
docker rm $(docker ps -a|grep auhil|awk '{print $1}')

docker run --name auhil \
        -itd -p 80:80 \
        -v /root/auhil/:/var/www/html/auhil \
        --privileged=true \
        auhil:latest

docker exec -d auhil memcached -d -u root
docker exec -d auhil httpd