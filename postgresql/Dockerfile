# First run:
#     $ docker build -t postgresql -rm=true .
#     $ docker run --name "db" postgresql
#     $ docker start db
#
# To try it out:
#     $ docker run --rm --it --volumes-from db postgresql psql -U postgres

FROM debian:jessie
MAINTAINER Andrey Petrov "andrey.petrov@shazow.net"

RUN apt-get update && apt-get install -y  \
    locales \
    --no-install-recommends

# Force en_US.UTF-8 locale.
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && dpkg-reconfigure -f noninteractive locales

ENV LC_ALL en_US.UTF-8
ENV PG_VERSION 9.4

RUN apt-get install -y \
    postgresql-$PG_VERSION \
    postgresql-contrib-$PG_VERSION \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && pg_dropcluster $PG_VERSION main --stop

ADD init.sh /init.sh

EXPOSE  5432
VOLUME  ["/var/lib/postgresql", "/etc/postgresql", "/var/run/postgresql"]
CMD     ["/init.sh"]
