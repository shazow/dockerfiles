# PostgreSQL

## Getting Started

```shell
$ docker run -d --name "db" shazow/postgresql
```

The default context inside the docker is the `postgres` user and local
permissions are trusted for this user so you can run exec commands conveniently.

Try it out:

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

Backup script:

```shell
$ docker exec db pg_dump db > dump.sql
```
