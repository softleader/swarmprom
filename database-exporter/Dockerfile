FROM        centos:7
WORKDIR     /exporter/
RUN         yum -y update && yum clean all
RUN         yum -y install libaio

COPY        ./ /exporter/

EXPOSE      9285

ENTRYPOINT  [ "/exporter/database_exporter", "-logtostderr=true" ]

