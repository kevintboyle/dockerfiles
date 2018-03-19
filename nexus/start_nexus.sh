#!/bin/bash

#docker build -t nexus -f ./nexus.docker .

docker stop nexus

docker rm nexus

docker run --name nexus -d -p 8081:8081 -v /Users/kevinboyle/ApplicationData/nexus:/nexus-data sonatype/nexus3