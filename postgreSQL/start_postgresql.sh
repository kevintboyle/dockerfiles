#!/bin/bash



#https://hub.docker.com/r/library/postgres/tags/

docker run --name postgres -e POSTGRES_PASSWORD=postgres -d postgres
