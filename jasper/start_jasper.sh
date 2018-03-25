#!/bin/bash

#install instructions
#http://jasperserver.sourceforge.net/docs/3-7-0/JasperServer-CE-Install-Guide.pdf

docker kill jasper
docker rm jasper
docker rmi jasper

export PGPASSWORD=jasper


../base_image/build_base_image.sh ubuntu jasper.Dockerfile $JASPER_BASE_IMAGE

cp $LIBRARY/jasper/TIB_js-jrs-cp_6.4.2_linux_x86_64.run .

cat <<EOF > jasper.Dockerfile

FROM $JASPER_BASE_IMAGE

RUN ["mkdir", "/usr/local/jasper"]

COPY TIB_js-jrs-cp_6.4.2_linux_x86_64.run /usr/local/jasper/.

RUN chmod a+x /usr/local/jasper/TIB_js-jrs-cp_6.4.2_linux_x86_64.run

RUN cd /usr/local/jasper && ./TIB_js-jrs-cp_6.4.2_linux_x86_64.run --mode unattended --prefix /usr/local/jasper/install --jasperLicenseAccepted yes


RUN echo "#!/bin/bash" > /tmp/start_jasper.sh
RUN echo "cd /usr/local/jasper/install" >> /tmp/start_jasper.sh
RUN echo "./ctlscript.sh start" >> /tmp/start_jasper.sh
RUN echo "tail -f /usr/local/jasper/install/apache-tomcat/logs/catalina.out" >> /tmp/start_jasper.sh


RUN chmod a+x /tmp/start_jasper.sh

ENTRYPOINT ["/tmp/start_jasper.sh"]



EOF

rm TIB_js-jrs-cp_6.4.2_linux_x86_64.run


docker build -t jasper -f jasper.Dockerfile .



