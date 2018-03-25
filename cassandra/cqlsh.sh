#!/bin/sh


docker run -it --link cassandra:cassandra --rm cassandra cqlsh cassandra
