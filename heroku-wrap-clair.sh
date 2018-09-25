#!/bin/sh
set -euo pipefail
# heroku-ify the clair config
_CLAIR_CONFIG=/etc/clair/config.yaml
python herokuify.py /etc/clair/config.raw.yaml $1 > $_CLAIR_CONFIG
# run clair normally
dumb-init -- /clair -config=$_CLAIR_CONFIG
