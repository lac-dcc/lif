#!/usr/bin/env bash

# Utilitary function that uses python to parse a yaml file, relying on the
# library pyyaml (pip install pyyaml). It takes the path to the yaml file
# as argument. It also takes a second param as the output associative array.
parse::yaml() {
    local path=$1
    local -n array_ref=$2

    # Parse yaml file using python script.
    local parsed=$(python -c \
        "from util import parse; print(parse.yaml(\"$path\"))")

    # Turn the python dictionary into a bash associative array.
    local -A tmp=$(echo $parsed \
            | sed "s/^{/(/" \
            | sed "s/}$/)/" \
            | sed "s/\[\([^]]*\)\]/\"\1\"/g" \
            | sed "s/'\([^']*\)':/\[\1\]=/g" \
            | sed "s/'//g" \
            | sed "s/[[:blank:]]//g" \
            | sed "s/,\[/ [/g")

    # Move the collected pairs of key/value to the output array.
    for key in ${!tmp[@]}; do array_ref[$key]=${tmp[$key]}; done
}
