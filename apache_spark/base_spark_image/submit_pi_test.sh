#!/bin/sh


/usr/local/apache_spark/spark-2.2.1-bin-hadoop2.7/bin/spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master spark://spark.kbh.org:7077 \
  /usr/local/apache_spark/spark-2.2.1-bin-hadoop2.7/examples/jars/spark-examples_2.11-2.2.1.jar \
  100
