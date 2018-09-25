#!/usr/bin/env python
# -*- coding: utf-8 -*-
# writing this as python2/3 ambiguous

import os, sys

def load_dynamic_env_variables(pair_list, target_dict):
    """ assumes that the <pair_list> is a list of strings of the form `VAR=VALUE` """
    # turn <pair_list> into tuples and load into the environment
    for key, value in {item[0]:item[1] for item in pair_list.split('=') if len(item) == 2}:
        target_dict[key] = value
    return target_dict

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

    environ = load_dynamic_env_variables(sys.argv[1:], os.environ)
    fname = sys.argv[1]
    print(parse_input_yaml(fname))
