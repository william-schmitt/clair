#!/bin/sh
set -eou pipefail
python herokify.py config.raw.yaml > config.yaml
# insert the PORT into the config.yaml
$GOBIN/./clair -config=config.yaml
