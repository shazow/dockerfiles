# uWSGI + Python + extras
#
# (See README.md for instructions)

FROM       debian:jessie
MAINTAINER Andrey Petrov "andrey.petrov@shazow.net"

RUN apt-get update && apt-get install -y  \
    build-essential \
    wget \
    make \
    python-dev \
    python-pip \
    python-psycopg2 \
    libfreetype6-dev \
    libjpeg-dev \
    libpng12-dev \
    libxml2-dev \
    --no-install-recommends

RUN pip install virtualenv uwsgi
ADD init /init

# Setup app user.
RUN useradd --create-home app
USER app
WORKDIR /home/app
RUN virtualenv --system-site-packages env

VOLUME  ["/home/app/src", "/home/app/env"]
CMD     ["/init"]
