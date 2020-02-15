FROM debian:buster
MAINTAINER Takao Sumitomo
LABEL OBJECT="PostgreSQL-11"

RUN apt-get -y update \
  && apt-get -y upgrade \
  && apt-get -y install postgresql-11 gosu

RUN chmod -R 777 /var/run/postgresql

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENV PATH /usr/lib/postgresql/11/bin:$PATH
ENV PGDATA /host_home/docker_home/postgresql-11

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
