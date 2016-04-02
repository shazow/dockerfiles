FROM debian:jessie
MAINTAINER Andrey Petrov "andrey.petrov@shazow.net"

RUN apt-get update
RUN apt-get install -y \
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
    && rm -rf /var/lib/apt/lists/*

COPY init /init
COPY start /start

USER postgres
COPY pg_hba.conf /etc/postgresql/$PG_VERSION/main/pg_hba.conf

EXPOSE  5432
VOLUME  ["/var/lib/postgresql", "/var/run/postgresql"]
CMD     ["/start"]
