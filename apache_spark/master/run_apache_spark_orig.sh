#!/bin/bash

cd /usr/local/apache_spark/spark-2.2.1-bin-hadoop2.7/sbin

./start-master.sh

./start-thriftserver.sh

cd ../logs

tail -f *master*.out



