#!/usr/bin/env bash

# We use the following scripts to collect statistics about each benchmark.
source cachegrind.sh
source measure.sh

# Takes the an array of benhcmarks (paths) to be analyzed.
collect::all() {
    local -n benchs_ref=$1

    mkdir -p results
    echo "Bench,Src,Type,N,Mean,Median,Std,#Outliers" > "results/exec_time.csv"
    echo "Bench,Type,N,Mean,Median,Std,#Outliers" > "results/pass_time.csv"
    echo "Bench,Src,Type,N,#LLVM-IR Instructions" > "results/size.csv"

    for bench in ${benchs_ref[@]}; do
        echo "Collecting data from ${bench}"
        # cachegrind::run "$bench"
        # cachegrind::filter "$bench"
        # measure::exec_time "$bench"
        # measure::size "$bench"
        # measure::pass_time "$bench"

        # Gather the collected data into a single place.
        local prefix=$(echo $bench | rev | sed -n "s:[^/]*\(/[^/]*\).*:\1:p" | rev)
        local name=$(echo $bench | rev | sed -n "s:\([^/]*\).*:\1:p" | rev)

        local file="${bench}/results/exec_time.csv"
        if [ -f $file ]; then
            sed -n -e "2,\$s:^:${prefix}${name},:p" \
                $file >> "results/exec_time.csv"
        fi

        local file="${bench}/results/pass_time.csv"
        if [ -f $file ]; then
            sed -n -e "2,\$s:^:${prefix}${name},:p" \
                $file >> "results/pass_time.csv"
        fi

        local file="${bench}/results/size.csv"
        if [ -f $file ]; then
            sed -n -e "2,\$s:^:${prefix}${name},:p" \
                $file >> "results/size.csv"
        fi
    done
    echo "Done"
}
