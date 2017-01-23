# nginx
#
# (See README.md for instructions)

FROM       debian:jessie
MAINTAINER Andrey Petrov "andrey.petrov@shazow.net"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    ca-certificates \
    nginx \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY conf.d/* /etc/nginx/conf.d/

EXPOSE 80 443
VOLUME  ["/var/cache/nginx", "/var/www", "/etc/nginx/certs", "/etc/nginx/sites-enabled"]
CMD     ["nginx", "-g", "daemon off;"]
