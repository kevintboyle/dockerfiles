
FROM ubuntu

USER root

RUN ["apt-get", "update"]

RUN ["apt-get", "--yes", "install", "vim" ]

RUN ["apt-get", "--yes", "install", "wget" ]

RUN ["apt-get", "--yes", "install", "default-jre"]

RUN ["apt-get", "--yes", "install", "unzip"]

RUN apt-get update && apt-get install -y maven vim

RUN ["apt-get", "--yes", "install", "curl" ]

RUN ["mkdir", "/usr/local/logstash"]

