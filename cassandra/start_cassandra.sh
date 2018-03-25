#!/bin/bash

#docker build -t cassandra -f ./cassandra.docker .

docker stop cassandra

docker rm cassandra


#https://hub.docker.com/r/bitnami/cassandra/ read about why creating a network bridge.
#https://yurisubach.com/2016/03/24/cassandra-docker-test-cluster/
#Use this
#https://hub.docker.com/_/cassandra/

docker run --name cassandra  -dit -v /Users/kevinboyle/ApplicationData/cassandra:/cassandra-data cassandra

