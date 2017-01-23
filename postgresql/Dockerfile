FROM debian:jessie
MAINTAINER Andrey Petrov "andrey.petrov@shazow.net"

RUN apt-get update
RUN apt-get install -y \
    locales ca-certificates wget \
    --no-install-recommends

# Add PostgreSQL debian package repo.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg" > /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - "https://www.postgresql.org/media/keys/ACCC4CF8.asc" | apt-key add - \
    && apt-get update \
    && apt-get upgrade -y

# Force en_US.UTF-8 locale.
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && dpkg-reconfigure -f noninteractive locales

ENV LC_ALL en_US.UTF-8
ENV PG_VERSION 9.6

RUN apt-get install -y \
    postgresql-$PG_VERSION \
    postgresql-contrib-$PG_VERSION \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY init /init
COPY start /start

USER postgres

EXPOSE  5432
VOLUME  ["/var/lib/postgresql", "/var/run/postgresql"]
CMD     ["/start"]
