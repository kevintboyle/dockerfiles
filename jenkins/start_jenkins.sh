#!/bin/bash

docker build -t jenkins_with_maven -f jenkins.Dockerfile .


docker stop jenkins

docker rm jenkins

mkdir /Users/kevinboyle/ApplicationData/jenkins_home/.m2

cp settings.xml /Users/kevinboyle/ApplicationData/jenkins_home/.m2/.

#docker run --name jenkins --link archiva  -dit -p 1010:8080 -p 1050:50000 -v /Users/kevinboyle/ApplicationData/jenkins_home:/var/jenkins_home jenkins_with_maven

docker run --name jenkins  -dit -p 1010:8080 -p 1050:50000 -v /Users/kevinboyle/ApplicationData/jenkins_home/jenkins_home:/var/jenkins_home jenkins_with_maven

