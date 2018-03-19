#!/bin/bash


/Users/kevinboyle/dev/apache_spark/spark-2.2.1-bin-hadoop2.7/bin/spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master spark://spark.kbh.org:7077 \
  /Users/kevinboyle/dev/apache_spark/spark-2.2.1-bin-hadoop2.7/examples/jars/spark-examples_2.11-2.2.1.jar \
  1000
