#!/bin/sh

docker build -t kevin_nginx -f ./nginx.docker .

docker run --name nginx -p 80:80 --dns=`ipconfig getifaddr en0` -d kevin_nginx

