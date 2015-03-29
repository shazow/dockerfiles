# uWSGI + Python + extras

Extras includes psycopg2 and image library headers.

## Getting Started

```shell
$ docker build -t "python-uwsgi" --rm=true .
$ docker run --name "app" -v "path/to/src:/app/src" -v "path/to/socks:/app/socks" python-uwsgi
```

## Details

When deployed, uWGSI will create a virtualenv in `/app/env`, then change its
working dir to `/app/src` and run:

```shell
python setup.py develop
make -e "INI_FILE=production.ini"
uwsgi --ini-paste production.ini
```

See `init.sh`.
