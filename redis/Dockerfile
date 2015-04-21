FROM debian:jessie
MAINTAINER Andrey Petrov <andrey.petrov@shazow.net>

RUN apt-get update && apt-get install -y \
    redis-server \
    --no-install-recommends

VOLUME   ["/var/redis"]
WORKDIR  ["/var/redis"]
CMD      ["/usr/bin/redis-server"]
