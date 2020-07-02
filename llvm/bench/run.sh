#!/usr/bin/env bash

# This is the main script, i.e. the entry point for building & collecting
# statistics from each benchmark.
source build.sh
source collect.sh

# Associative array linking benchmarks to a list of functions to be transformed
# (comma-separeted strings).
declare -A benchlist=(
    [comp]="comp"
    [mu]="mu"
)

while [ $# -gt 0 ]; do
    case $1 in
        -h|--help)
            echo -e "==============================================================================="
            echo -e "=====                     Build & collect statistics                      ====="
            echo -e "===============================================================================\n"
            echo -e "-h, --help\t\tPrint this help message"
            echo -e "-b, --build\t\tBuild & apply the invariant transformation"
            echo -e "\t\t\tto each benchmark"
            echo -e "-c, --collect\t\tCollect statistics from each benchmark. This option"
            echo -e "\t\t\tassumes that the benchmarks were previously built"
            echo -e "-a, --all\t\tBuild & collect"
            shift
            ;;
        -b|--build)
            shift
            build::all benchlist
            ;;
        -c|--collect)
            collect::all benchlist
            shift
            ;;
        -a|--all)
            build::all benchlist && collect::all benchlist
            shift
            ;;
        *)
            echo "Invalid option: $1"
            shift
    esac
done
