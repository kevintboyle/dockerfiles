#!/bin/bash

docker build -t apache_spark -f ./apache_spark.docker .

docker stop apache_spark

docker rm apache_spark

#docker run --name apache_spark  -p 15151:10000 -p 4545:4040 -p 6565:6066 -p 7575:7077 -p 9595:8080 -dit -v /Users/kevinboyle/ApplicationData/apache_spark:/apache_spark_data apache_spark

docker run --name apache_spark  -p 10000:10000 -p 4040:4040 -p 6066:6066 -p 7077:7077 -p 8080:8080 -dit -v /Users/kevinboyle/ApplicationData/apache_spark:/apache_spark_data apache_spark


#docker run --name apache_spark  -P -dit -v /Users/kevinboyle/ApplicationData/apache_spark:/apache_spark_data apache_spark

