#!/bin/bash

docker build -t start_spark -f ./start_spark.docker .

docker run --name start_spark -p 10000:10000 -p 4040:4040 -p 6066:6066 -p 7077:7077 -p 8080:8080 -dit start_spark

