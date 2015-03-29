# PostgreSQL

## Getting Started

```shell
$ docker run --name "db" shazow/postgresql
$ docker start db
```

To try it out:

```shell
$ docker run --rm --it --volumes-from db shazow/postgresql psql -U postgres
```
