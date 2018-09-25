#!/bin/sh
# heroku-ify the clair config
python herokuify.py /etc/clair/config.raw.yaml $1 > /etc/clair/config.yaml
# run clair normally
dumb-init -- /clair -config=$HOME/clair/config.yaml
