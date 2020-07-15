#!/usr/bin/env bash

# This is the main script, i.e. the entry point for building & collecting
# statistics from each benchmark.
source build.sh
source collect.sh

# Array of benchmarks to be transformed & analyzed.
declare -a benchs=(
    "comp"
    "mu" 
    "3way"
    "dudect-examples/aes32"
    "dudect-examples/donnabad"
    "bearssl/hash/md5"
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
            build::all benchs
            ;;
        -c|--collect)
            collect::all benchs
            shift
            ;;
        -a|--all)
            build::all benchs && collect::all benchs
            shift
            ;;
        *)
            echo "Invalid option: $1"
            shift
    esac
done
