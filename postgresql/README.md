# PostgreSQL

## Getting Started

```shell
$ docker run -d --name "db" shazow/postgresql
```

To try it out:

```shell
$ docker exec -it db psql
```

Reset postgres user password and make a fresh database:

```shell
$ docker exec db /init
ALTER ROLE
CREATE DATABASE
* Credentials: url="postgresql://postgres:XXX@172.17.0.32/db"
```
