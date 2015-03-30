# uWSGI + Python + extras
#
# (See README.md for instructions)

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
    uwsgi-plugin-python \
    --no-install-recommends

RUN pip install virtualenv
ADD init /init

RUN useradd --create-home app
USER app
WORKDIR /home/app

VOLUME  ["/home/app/src"]
CMD     ["/init"]
