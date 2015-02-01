#!/bin/sh

pip install uwsgi PasteDeploy
virtualenv --system-site-packages env
. env/bin/activate

cd src
python setup.py develop
make -e "INI_FILE=production.ini"
uwsgi --ini-paste production.ini
