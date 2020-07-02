#!/usr/bin/env bash

# We use the following scripts to collect statistics about each benchmark.
source cachegrind.sh

# Takes the name of an associative array where key is the path to a benchmark
# and value is a list of transformed functions (comma-separated strings) to
# be analyzed.
collect::all() {
    local -n benchlist_ref=$1
    for bench in ${!benchlist_ref[@]}; do
        echo "Running cachegrind on ${bench}"
        cachegrind::run $bench
        cachegrind::filter $bench ${benchlist_ref[$bench]}
        echo "Generated cachegrind CSV file: ${bench}/results/cachegrind.csv"
    done
    echo "Done"
}
