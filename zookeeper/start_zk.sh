#!/bin/bash


docker stop zookeeper

docker rm zookeeper


#https://hub.docker.com/_/zookeeper/

docker run --name zookeeper --restart always -d zookeeper



