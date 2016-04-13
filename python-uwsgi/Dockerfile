# uWSGI + Python + extras
#
# (See README.md for instructions)

FROM       debian:jessie
MAINTAINER Andrey Petrov "andrey.petrov@shazow.net"

RUN apt-get update
RUN apt-get install -y \
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
    libxslt1-dev \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -U pip setuptools && pip install -U virtualenv uwsgi
ADD init /init

# Setup app user.
RUN useradd --create-home app
USER app
WORKDIR /home/app

EXPOSE  3031
VOLUME  ["/home/app/src", "/home/app/env"]
CMD     ["/init"]
