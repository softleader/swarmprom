FROM        centos:7
RUN         yum -y update && \
            yum clean all && \
            yum -y install libaio && \
            yum -y install zip unzip

COPY        ./database_exporter /exporter/
COPY        ./config /exporter/config
COPY        instantclient-basic-linux.x64-19.3.0.0.0dbru.zip /opt/oracle/instantclient-basic-linux.x64-19.3.0.0.0dbru.zip
ENV         LD_LIBRARY_PATH=/opt/oracle/instantclient_19_3

RUN         cd /opt/oracle && \
            unzip instantclient-basic-linux.x64-19.3.0.0.0dbru.zip && \
            cd /opt/oracle/instantclient_19_3 && \
            export PATH=$LD_LIBRARY_PATH:$PATH

WORKDIR     /exporter/
EXPOSE      9285

ENTRYPOINT  [ "/exporter/database_exporter", "-logtostderr=true" ]

