# uWSGI + Python
#
# uWSGI reads its configuration from /app/src/production.ini.
#
# First run:
#     $ docker build -t "python-uwsgi" --rm=true .
#     $ docker run --name "app" -v "path/to/src:/app/src" -v "path/to/socks:/app/socks" python-uwsgi

FROM       debian:jessie
MAINTAINER Andrey Petrov "andrey.petrov@shazow.net"

RUN apt-get update && apt-get install -y  \
    wget \
    make \
    python-dev \
    python-pip \
    python-psycopg2 \
    libfreetype6-dev \
    libjpeg-dev \
    libpng12-dev \
    --no-install-recommends

RUN pip install virtualenv

ADD init.sh /init.sh

VOLUME  ["/app/src", "/app/env", "/app/socks"]
CMD     ["/init.sh"]
