#!/bin/bash

docker build -t archiva -f ./archiva.docker .

docker stop archiva

docker rm archiva

docker run --name archiva  -dit -p 9090:8080 -v /Users/kevinboyle/ApplicationData/archiva:/archiva-data archiva

