#!/bin/bash


if  [ "$1x" = "x" ] || [ "$2x" = "x" ] || [ "$3x" = "x" ] ; then
	echo build_base_image.sh base_docker_hub_image output_dockerfile_name output_base_image_name
	exit 1
fi

if [ ! -z $1 ]; then
	export BASE_DOCKER_HUB_IMAGE=$1
else
	export BASE_DOCKER_HUB_IMAGE="ubuntu"
fi

if [ ! -z $2 ]; then
	export DOCKERFILE_NAME=$2
else
	export DOCKERFILE_NAME="Dockerfile"
fi

if [ ! -z $3 ];  then
	export FINAL_BASE_IMAGE_NAME=$3
else
	export FINAL_BASE_IMAGE_NAME="base_image"
fi

export LOGSTASH_VERSION=logstash-6.2.3

echo "BASE_DOCKER_HUB_IMAGE=" $BASE_DOCKER_HUB_IMAGE
echo "DOCKERFILE_NAME=" $DOCKERFILE_NAME
echo "FINAL_BASE_IMAGE_NAME=" $FINAL_BASE_IMAGE_NAME

cat <<EOF > $DOCKERFILE_NAME

FROM $BASE_DOCKER_HUB_IMAGE

USER root

RUN ["apt-get", "update"]

RUN ["apt-get", "--yes", "install", "vim" ]

RUN ["apt-get", "--yes", "install", "wget" ]

RUN ["apt-get", "--yes", "install", "default-jre"]

RUN ["apt-get", "--yes", "install", "unzip"]

RUN apt-get update && apt-get install -y maven vim

RUN ["apt-get", "--yes", "install", "curl" ]

RUN ["mkdir", "/usr/local/logstash"]

EOF


docker build -t $FINAL_BASE_IMAGE_NAME -f $DOCKERFILE_NAME .


