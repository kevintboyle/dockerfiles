FROM ubuntu

RUN ["mkdir", "/usr/local/apache_spark"]

RUN ["apt-get", "update"]

RUN ["apt-get", "--yes", "install", "vim" ]

RUN ["apt-get", "--yes", "install", "wget" ]

RUN cd /usr/local/apache_spark && wget https://archive.apache.org/dist/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz

RUN cd /usr/local/apache_spark && gunzip spark-2.2.1-bin-hadoop2.7.tgz

RUN cd /usr/local/apache_spark && tar -xvf spark-2.2.1-bin-hadoop2.7.tar

RUN ["apt-get", "--yes", "install", "default-jre"]

RUN ["apt-get", "--yes", "install", "iputils-ping"]

COPY person.txt /tmp/person.txt

COPY submit_pi_test.sh /tmp/submit_pi_test.sh





