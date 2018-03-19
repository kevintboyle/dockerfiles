FROM ubuntu

RUN ["mkdir", "/usr/local/apache_spark"]

RUN ["apt-get", "update"]

RUN ["apt-get", "--yes", "install", "vim" ]

RUN ["apt-get", "--yes", "install", "wget" ]

RUN cd /usr/local/apache_spark && wget https://archive.apache.org/dist/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz 

RUN cd /usr/local/apache_spark && gunzip spark-2.2.1-bin-hadoop2.7.tgz 

RUN cd /usr/local/apache_spark && tar -xvf spark-2.2.1-bin-hadoop2.7.tar

RUN ["apt-get", "--yes", "install", "default-jre"]

#Prepare start script and run

COPY person.txt /tmp/person.txt

RUN echo "#!/bin/bash"> /tmp/start_apache_spark.sh
RUN echo "cd /usr/local/apache_spark/spark-2.2.1-bin-hadoop2.7/sbin" >> /tmp/start_apache_spark.sh
RUN echo "./start-master.sh" >> /tmp/start_apache_spark.sh
RUN echo "./start-thriftserver.sh" >> /tmp/start_apache_spark.sh
#RUN echo "sleep 120 " >> /tmp/start_apache_spark.sh
RUN echo "./start-slave.sh spark://\`hostname\`:7077" >> /tmp/start_apache_spark.sh
RUN echo "cd ../logs" >> /tmp/start_apache_spark.sh
RUN echo "tail -f *master*.out" >> /tmp/start_apache_spark.sh
RUN chmod a+x /tmp/start_apache_spark.sh


ENTRYPOINT ["/tmp/start_apache_spark.sh"]

