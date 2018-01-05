#!/bin/bash

docker kill $(docker ps -a|grep auhil|awk '{print $1}')
docker rm $(docker ps -a|grep auhil|awk '{print $1}')