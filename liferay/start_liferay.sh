#!/bin/bash


cp $LIBRARY/liferay-ce-portal-7.0-ga5.tar .


docker build -t liferay -f ./liferay.Dockerfile .

rm -f liferay-ce-portal-7.0-ga5.tar

docker stop liferay

docker rm liferay

docker run -h $LIFERAY_HOST_DNS --name liferay -p 8888:8080 -dit -v $LIFERAY_DATA_DIR:/liferay_data liferay



