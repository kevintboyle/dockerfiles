#!/bin/bash


./stop_all.sh


archiva/start_archiva.sh

httpd_with_proxy/start_httpd.sh

jenkins/start_jenkins.sh

tomcat/start_tomcat.sh


