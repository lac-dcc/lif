import sys
from yaml import safe_load

def yaml(path):
    with open(path, 'r') as stream:
        return safe_load(stream)
