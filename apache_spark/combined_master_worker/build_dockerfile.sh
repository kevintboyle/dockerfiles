#!/bin/bash



export MASTER_PORT=8080
export THRIFT_PORT=8081
export SLAVE_PORT=8082

cat <<EOF > apache_spark_master.Dockerfile

FROM $SPARK_BASE_IMAGE

RUN echo "#!/bin/bash"> /tmp/start_apache_spark.sh
RUN echo "cd /usr/local/apache_spark/spark-2.2.1-bin-hadoop2.7/sbin" >> /tmp/start_apache_spark.sh
RUN echo "./start-master.sh --host $SPARK_HOST --webui-port $MASTER_PORT" >> /tmp/start_apache_spark.sh
#RUN echo "./start-thriftserver.sh --host $SPARK_HOST --webui-port $THRIFT_PORT --master spark://$SPARK_HOST:7077" >> /tmp/start_apache_spark.sh
#RUN echo "sleep 120 " >> /tmp/start_apache_spark.sh
RUN echo "./start-slave.sh  --host $SPARK_HOST --webui-port $SLAVE_PORT spark://$SPARK_HOST:7077" >> /tmp/start_apache_spark.sh
RUN echo "cd ../logs" >> /tmp/start_apache_spark.sh
RUN echo "tail -f *master*.out" >> /tmp/start_apache_spark.sh
RUN chmod a+x /tmp/start_apache_spark.sh


ENTRYPOINT ["/tmp/start_apache_spark.sh"]



EOF

