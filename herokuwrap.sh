#!/bin/sh
python herokify.py config.raw.yaml > config.yaml
# insert the PORT into the config.yaml
clair -config=config.yaml