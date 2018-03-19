#!/bin/bash

docker build -t httpd_with_proxy -f httpd_with_proxy.dockerfile .

docker stop httpd_with_proxy

docker rm httpd_with_proxy

docker run --name httpd_with_proxy  -dit -p 80:80 -v /Data/docker_share/httpd/htdocs:/user/local/apache2/htdocs httpd_with_proxy

