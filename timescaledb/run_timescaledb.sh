#!/bin/bash

#https://docs.timescale.com/v0.9/getting-started/installation/mac/installation-docker

docker stop timescaledb

docker rm timescaledb


docker run -d --name timescaledb -p 5432:5432 timescale/timescaledb

