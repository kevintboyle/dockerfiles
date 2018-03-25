
FROM ubuntu

USER root

RUN ["apt-get", "update"]

RUN ["apt-get", "--yes", "install", "vim" ]

RUN ["apt-get", "--yes", "install", "wget" ]

RUN ["apt-get", "--yes", "install", "default-jre"]

RUN apt-get update && apt-get install -y maven vim

RUN ["apt-get", "--yes", "install", "curl" ]

RUN ["mkdir", "/usr/local/logstash"]

COPY logstash-6.2.3.tar.gz /usr/local/logstash/.

RUN cd /usr/local/logstash && gunzip logstash-6.2.3.tar.gz

RUN cd /usr/local/logstash && tar -xvf logstash-6.2.3.tar

