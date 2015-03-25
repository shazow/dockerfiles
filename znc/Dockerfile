# ZNC with buildmod enabled.
#
# Build the image and create data container:
#   $ docker build -t znc --rm .
#   $ docker create -v $PWD/znc:/home/znc/.znc --name=znc-data znc
#
# Generate PEM and config, alternatively popular znc directory as if it were ~/.znc:
#   $ docker run --rm --volumes-from=znc-data znc:latest znc --makepem
#   $ docker run --rm --volumes-from=znc-data -it znc:latest znc --makeconf
#
# Build modules (optional):
#   $ mkdir znc/src
#   $ git clone https://github.com/jreese/znc-push znc/src/znc-push
#   $ docker run --rm --volumes-from=znc-data znc:latest znc-buildmod .znc/src/znc-push/push.cpp
#   Building ".znc/src/znc-push/push.so" for ZNC 1.4... [ ok ]
#
# Run:
#   $ docker run --detach --restart=always --name znc --volumes-from=znc-data --publish 7000:7000 znc:latest
#
#
# TODO: We could make a more stripped-down znc docker if we separate the
# znc-buildmod into a separate image.
#

FROM debian:jessie
MAINTAINER Andrey Petrov <andrey.petrov@shazow.net>

RUN apt-get update && apt-get install -y \
    ca-certificates \
    znc \
    --no-install-recommends

# Extra stuff for znc-buildmod (can remove if we don't care about building modules)
RUN apt-get install -y \
    build-essential \
    libcurl4-openssl-dev \
    znc-dev \
    --no-install-recommends

# Make user
RUN useradd --create-home znc
USER znc
WORKDIR /home/znc

VOLUME ["/home/znc/.znc"]
CMD ["znc", "-f"]
