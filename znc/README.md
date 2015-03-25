# ZNC

Build the image (can skip this if you're using the hub version):

```shell
$ docker build -t znc --rm .
```

Create data container:

```shell
$ docker create -v $PWD/znc:/home/znc/.znc --name=znc-data znc
```

Generate PEM and config, alternatively popular znc directory as if it were ~/.znc:

```shell
$ docker run --rm --volumes-from=znc-data znc:latest znc --makepem
$ docker run --rm --volumes-from=znc-data -it znc:latest znc --makeconf
```

Build modules (optional, example for building znc-push):

```shell
$ mkdir znc/src
$ git clone https://github.com/jreese/znc-push znc/src/znc-push
$ docker run --rm \
    --volumes-from=znc-data \
    znc:latest \
    znc-buildmod .znc/src/znc-push/push.cpp
Building ".znc/src/znc-push/push.so" for ZNC 1.4... [ ok ]
```

Run the container:

```shell
$ docker run --detach --restart=always \
    --name znc --volumes-from=znc-data \
    --publish 7000:7000 \
    znc:latest
```


## TODO

* We could make a more stripped-down znc docker if we separate the
  znc-buildmod into a separate image.
