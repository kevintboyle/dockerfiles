FROM ubuntu

RUN ["mkdir", "/usr/local/liferay"]

RUN ["apt-get", "update"]

RUN ["apt-get", "--yes", "install", "vim" ]

RUN ["apt-get", "--yes", "install", "wget" ]

RUN ["apt-get", "--yes", "install", "curl" ]


COPY liferay-ce-portal-7.0-ga5.tar /usr/local/liferay/.

RUN cd /usr/local/liferay && tar -xvf liferay-ce-portal-7.0-ga5.tar

RUN ["apt-get", "--yes", "install", "default-jre"]

RUN ["apt-get", "--yes", "install", "iputils-ping"]

#ENTRYPOINT ["/usr/local/liferay/liferay-ce-portal-7.0-ga5/tomcat-8.0.32/bin/startup.sh"]




