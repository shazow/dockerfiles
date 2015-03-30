# uWSGI + Python + extras

Extras includes psycopg2 and image library headers.

## Getting Started

```shell
$ docker run --name "app" -v "path/to/src:/home/app/src" python-uwsgi
```

It will be up to you to `--expose` the appropriate port and link it, or mount a
sock to share.

## Details

When deployed, uWGSI will create a virtualenv in `/app/env`, then change its
working dir to `/app/src` and run:

```shell python setup.py develop make "INI_FILE=$INI_FILE" uwsgi --ini-paste
"$INI_FILE" ```

Typically I set `INI_FILE=production.ini` in the env. See `init.sh`.
