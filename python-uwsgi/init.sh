#!/bin/sh

if [[ ! "$INI_FILE" ]]; then
    INI_FILE="production.ini";
fi

pip install uwsgi PasteDeploy
virtualenv --system-site-packages env
. env/bin/activate

cd src
python setup.py develop
make INI_FILE="$INI_FILE"
uwsgi --ini-paste "$INI_FILE"
