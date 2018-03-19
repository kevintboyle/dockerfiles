#!/bin/bash

docker rmi spark_base_image

docker build -t spark_base_image -f ./base_image.Dockerfile .


