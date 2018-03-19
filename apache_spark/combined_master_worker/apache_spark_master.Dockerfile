
FROM spark_base_image

RUN echo "#!/bin/bash"> /tmp/start_apache_spark.sh
RUN echo "cd /usr/local/apache_spark/spark-2.2.1-bin-hadoop2.7/sbin" >> /tmp/start_apache_spark.sh
RUN echo "./start-master.sh --host spark.kbh.org --webui-port 8080" >> /tmp/start_apache_spark.sh
#RUN echo "./start-thriftserver.sh --host spark.kbh.org --webui-port 8081 --master spark://spark.kbh.org:7077" >> /tmp/start_apache_spark.sh
#RUN echo "sleep 120 " >> /tmp/start_apache_spark.sh
RUN echo "./start-slave.sh  --host spark.kbh.org --webui-port 8082 spark://spark.kbh.org:7077" >> /tmp/start_apache_spark.sh
RUN echo "cd ../logs" >> /tmp/start_apache_spark.sh
RUN echo "tail -f *master*.out" >> /tmp/start_apache_spark.sh
RUN chmod a+x /tmp/start_apache_spark.sh


ENTRYPOINT ["/tmp/start_apache_spark.sh"]



