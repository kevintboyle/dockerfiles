#!/bin/bash

export SPARK_HOST=spark.kbh.org


./build_dockerfile.sh

docker build -t apache_spark -f ./apache_spark_master.Dockerfile .

docker stop apache_spark

docker rm apache_spark

docker run -h $SPARK_HOST --name apache_spark -p 10000:10000 -p 4040:4040 -p 6066:6066 -p 7077:7077 -p 8080:8080 -p 8081:8081 -p 8082:8082  -dit -v $SPARK_DATA_DIR:/apache_spark_data apache_spark



