#!/usr/bin/env python
# -*- coding: utf-8 -*-
# writing this as python2/3 ambiguous

import os, sys

def parse_input_yaml(fname, environ=os.environ):
    """ load a file and treat it like a format string given the dictionary passed in"""
    rawfile = ''.join(open(fname, 'r').readlines())
    parsed_file = rawfile.format(**environ)
    return parsed_file

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("usage `python herokify.py <file to be parsed>`")
        sys.exit(1)
    if sys.argv[1] == 'help' or sys.argv[1] == 'h':
        print("This script will take in a yaml file and reinterpret it as a python string and run format against all environment variables")
        sys.exit(1)

    fname = sys.argv[1]
    print(parse_input_yaml(fname, os.environ))
