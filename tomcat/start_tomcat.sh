#!/bin/bash

docker stop tomcat

docker rm tomcat

docker run --name tomcat  -dit -p 8080:8080 tomcat

