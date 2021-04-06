#!/usr/bin/env bash

source parse.sh

# Takes the path to a benchmark and produces a CSV file with some statistics
# related to the execution time of a program.
measure::exec_time() {
    local bench=$1
    local sources=${bench}/src
    local bin=${bench}/bin
    local results=${bench}/results

    # File names with prefix "measure" refer to source files used to measure
    # execution time of the benchmark.
    srcs=($(ls $sources | grep "measure"))
    if [ ${#srcs[@]} -eq 0 ]; then return; fi

    local -A meta
    parse::yaml ${bench}/meta.yaml meta
    local -a measure=(${meta[measure]//,/ })

    # Generate a CSV file for the exec. time measurement.
    echo "Src,Type,N,Mean,Median,Std,#Outliers" > ${results}/exec_time.csv

    for src in ${srcs[@]}; do
        # Get rid of the language extension so we can use the src name.
        local srcname=$(echo $src | sed "s/\.[^.]*$//")

        # First we test the original program:
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local fullname="${srcname}_${size}"
            # We run each test 1000 times again so we can get the mean of the
            # executions and reduce possible noises.
            local -a elapsed=()
            for _ in {1..1000}; do
                elapsed+=($(${bin}/${fullname}))
            done

            local args=${elapsed[@]}
            args=${args// /, }
            python -c \
                "from util import stats; print(stats.compute(3, $args))" \
                > tmp.yaml

            local -A stats=()
            parse::yaml tmp.yaml stats

            local row="${srcname},orig,${size},${stats[mean]}"
            row="${row},${stats[median]},${stats[std]},${stats[outliers]}"
            echo "$row" >> ${results}/exec_time.csv
        done

        # Now, the original program optimized:
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local fullname="${srcname}_${size}"
            local -a elapsed=()
            for _ in {1..1000}; do
                elapsed+=($(${bin}/${fullname}.opt))
            done

            local args=${elapsed[@]}
            args=${args// /, }
            python -c \
                "from util import stats; print(stats.compute(3, $args))" \
                > tmp.yaml

            local -A stats=()
            parse::yaml tmp.yaml stats

            local row="${srcname},orig-opt,${size},${stats[mean]}"
            row="${row},${stats[median]},${stats[std]},${stats[outliers]}"
            echo "$row" >> ${results}/exec_time.csv
        done

        # Then, the isochronous version:
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local fullname="${srcname}_${size}"
            local -a elapsed=()
            for _ in {1..1000}; do
                elapsed+=($(${bin}/${fullname}_isochr))
            done

            local args=${elapsed[@]}
            args=${args// /, }
            python -c \
                "from util import stats; print(stats.compute(3, $args))" \
                > tmp.yaml

            local -A stats=()
            parse::yaml tmp.yaml stats

            local row="${srcname},lif,${size},${stats[mean]}"
            row="${row},${stats[median]},${stats[std]},${stats[outliers]}"
            echo "$row" >> ${results}/exec_time.csv
        done

        # And the isochronous version optimized:
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local fullname="${srcname}_${size}"
            local -a elapsed=()
            for _ in {1..1000}; do
                elapsed+=($(${bin}/${fullname}_isochr.opt))
            done

            local args=${elapsed[@]}
            args=${args// /, }
            python -c \
                "from util import stats; print(stats.compute(3, $args))" \
                > tmp.yaml

            local -A stats=()
            parse::yaml tmp.yaml stats

            local row="${srcname},lif-opt,${size},${stats[mean]}"
            row="${row},${stats[median]},${stats[std]},${stats[outliers]}"
            echo "$row" >> ${results}/exec_time.csv
        done

        # Now, Wu's version:
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local fullname="${srcname}_${size}"
            local -a elapsed=()
            local row="${srcname},wu,${size}"
            if [ -f ${bin}/${fullname}_wu ]; then
                local -a elapsed=()
                for _ in {1..1000}; do
                    elapsed+=($(${bin}/${fullname}_wu))
                done

                local args=${elapsed[@]}
                args=${args// /, }
                python -c \
                    "from util import stats; print(stats.compute(3, $args))" \
                    > tmp.yaml

                local -A stats=()
                parse::yaml tmp.yaml stats
                row="${row},${stats[mean]},${stats[median]}"
                row="${row},${stats[std]},${stats[outliers]}"
            else
                row="${row},-1,-1,-1,-1"
            fi
            echo "$row" >> ${results}/exec_time.csv
        done

        # And finally, Wu's optimized version:
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local fullname="${srcname}_${size}"
            local row="${srcname},wu-opt,${size}"
            if [ -f ${bin}/${fullname}_wu.opt ]; then
                local -a elapsed=()
                for _ in {1..1000}; do
                    elapsed+=($(${bin}/${fullname}_wu.opt))
                done

                local args=${elapsed[@]}
                args=${args// /, }
                python -c \
                    "from util import stats; print(stats.compute(3, $args))" \
                    > tmp.yaml

                local -A stats=()
                parse::yaml tmp.yaml stats
                row="${row},${stats[mean]},${stats[median]}"
                row="${row},${stats[std]},${stats[outliers]}"
            else
                row="${row},-1,-1,-1,-1"
            fi
            echo "$row" >> ${results}/exec_time.csv
        done
        rm tmp.yaml
    done
    echo "Generated exec. time CSV file: ${bench}/results/exec_time.csv"
}

# Takes the path to a benchmark and produces a CSV file containing statistics
# about the number of llvm-ir instructions of some functions.
measure::size() {
    local bench=$1;
    local sources=${bench}/src
    local llvmir=${bench}/llvm-ir
    local results=${bench}/results

    # File names with prefix "measure" refer to source files used to measure
    # execution time of the benchmark.
    srcs=($(ls $sources | grep "measure"))
    if [ ${#srcs[@]} -eq 0 ]; then return; fi

    # Parse the bench/meta.yaml file to get the name of the functions.
    local -A meta
    parse::yaml ${bench}/meta.yaml meta
    local -a measure=(${meta[measure]//,/ })

    # Generate a CSV file for the exec. time measurement.
    echo "Src,Type,N,#LLVM-IR Instructions" > ${results}/size.csv

    for src in ${srcs[@]}; do
        # Get rid of the language extension so we can use the src name.
        local srcname=$(echo $src | sed "s/\.[^.]*$//")

        # First we test the original program:
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local fullname="${srcname}_${size}"
            local llvm_size=$(util/instcount ${llvmir}/${fullname}.ll \
                | sed -n -E "s/Total: ([0-9]+)$/\1/p")

            echo "${srcname},orig,${size},${llvm_size}" \
                >> ${bench}/results/size.csv
        done

        # Now, the original program optimized:
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local fullname="${srcname}_${size}"
            local llvm_size=$(util/instcount ${llvmir}/${fullname}.opt.ll \
                | sed -n -E "s/Total: ([0-9]+)$/\1/p")

            echo "${srcname},orig-opt,${size},${llvm_size}" \
                >> ${bench}/results/size.csv
        done

        # Then, the isochronous version:
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local fullname="${srcname}_${size}"
            local llvm_size=$(util/instcount ${llvmir}/${fullname}_isochr.ll \
                | sed -n -E "s/Total: ([0-9]+)$/\1/p")

            echo "${srcname},lif,${size},${llvm_size}" \
                >> ${bench}/results/size.csv
        done

        # And the isochronous version optimized:
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local fullname="${srcname}_${size}"
            local llvm_size=$(util/instcount ${llvmir}/${fullname}_isochr.opt.ll \
                | sed -n -E "s/Total: ([0-9]+)$/\1/p")

            echo "${srcname},lif-opt,${size},${llvm_size}" \
                >> ${bench}/results/size.csv
        done

        # Now, wu's version (if possibe).
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local row="${srcname},wu,${size}"
            local fullname="${srcname}_${size}"
            if [ -f ${llvmir}/${fullname}_wu.ll ]; then
                local llvm_size=$(util/instcount ${llvmir}/${fullname}_wu.ll \
                    | sed -n -E "s/Total: ([0-9]+)$/\1/p")

                echo "${row},${llvm_size}" >> ${bench}/results/size.csv
            else
                echo "${row},-1" >> ${bench}/results/size.csv
            fi
        done

        # And finally, wu's opt version.
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local row="${srcname},wu-opt,${size}"
            local fullname="${srcname}_${size}"
            if [ -f ${llvmir}/${fullname}_wu.opt.ll ]; then
                local llvm_size=$(util/instcount ${llvmir}/${fullname}_wu.opt.ll \
                    | sed -n -E "s/Total: ([0-9]+)$/\1/p")

                echo "${row},${llvm_size}" >> ${bench}/results/size.csv
            else
                echo "${row},-1" >> ${bench}/results/size.csv
            fi
        done
    done
    echo "Generated llvm-ir size CSV file: ${bench}/results/size.csv"
}

# Takes the path to a benchmark and produces a CSV file containing statistics
# about the time related to running the isochronous pass.
measure::pass_time() {
    local bench=$1;
    local sources=${bench}/src
    local llvmir=${bench}/llvm-ir
    local results=${bench}/results

    # File names with prefix "measure" refer to source files used to measure
    # execution time of the benchmark.
    srcs=($(ls $sources | grep "measure"))
    if [ ${#srcs[@]} -eq 0 ]; then return; fi

    # Parse the bench/meta.yaml file to get the name of the functions.
    local -A meta
    parse::yaml ${bench}/meta.yaml meta

    # Generate a CSV file for the exec. time measurement.
    echo "Type,N,Mean,Median,Std,#Outliers" > ${results}/pass_time.csv

    # We only need to measure the compile time for one of the src files, not all
    # of them.
    local src=${srcs[0]}
    # Get rid of the language extension so we can use the src name.
    local srcname=$(echo $src | sed "s/\.[^.]*$//")

    local -a measure=(${meta[measure]//,/ })

    for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
        # Run the isochronous tool without optimizations, passing opt's
        # "time-passes" option so we can extract the "user+system" time of our
        # pass.
        local num="[0-9]*\.?[0-9]*"
        local blank="[[:blank:]]*"
        local -a regex=(
            # User time
            "${blank}${num}${blank}\(.*\)${blank}"
            # User+System time
            "(${num})${blank}\(.*\)${blank}"
            # Wall time
            "${num}${blank}\(.*\)${blank}"
            # Identify the isochr. pass
            "(isochronous::Pass|Sensitive_Branch_Mitigation_Pass).*$"
        )

        local regex_str=${regex[@]}
        regex_str=${regex_str// /}
        regex_str=${regex_str//_/ }

        # First, we measure our transformation (50 samples).
        local -a elapsed=()
        for _ in {1..50}; do
            # The time-passes option prints to the std error output.
            ../build/bin/lif -O0 -names=${meta[functions]} -time-passes \
                "${llvmir}/${srcname}_${size}.ll" -o "${llvmir}/tmp.ll" \
                2> time.txt
            local time=$(cat time.txt | sed -n -E "s/${regex_str}/\1/p")
            elapsed+=($time)
        done

        local args=${elapsed[@]}
        args=${args// /, }
        python -c "from util import stats; print(stats.compute(3, $args))" \
            > tmp.yaml

        local -A stats=()
        parse::yaml tmp.yaml stats

        local row="lif,${size},${stats[mean]}"
        row="${row},${stats[median]},${stats[std]},${stats[outliers]}"
        echo $row >> ${bench}/results/pass_time.csv

        # Now, we measure wu's transformation (if possible).
        local err=$(opt -S -load util/wu.so -branch \
            "${llvmir}/${srcname}_${size}.ll" -o "${llvmir}/tmp.ll" \
            2>&1)

        local row="wu,${size}"
        echo $err | grep -q "LLVM ERROR"
        local success=$?
        if [ $success -ne 0 ]; then
            elapsed=()
            for _ in {1..50}; do
                opt -S -load util/wu.so -branch -time-passes \
                    "${llvmir}/${srcname}_${size}.ll" -o "${llvmir}/tmp.ll" \
                    2> time.txt
                local time=$(cat time.txt | sed -n -E "s/${regex_str}/\1/p")
                elapsed+=($time)
            done

            args=${elapsed[@]}
            args=${args// /, }
            python -c "from util import stats; print(stats.compute(3, $args))" \
                > tmp.yaml

            stats=()
            parse::yaml tmp.yaml stats

            row="${row},${stats[mean]},${stats[median]}"
            row="${row},${stats[std]},${stats[outliers]}"
            echo $row >> ${bench}/results/pass_time.csv
        else
            echo "${row},-1,-1,-1,-1" >> ${bench}/results/pass_time.csv
        fi
    done

    rm -f "${llvmir}/tmp.ll"
    rm -f time.txt
    echo "Generated isochronous pass time CSV file: ${bench}/results/pass_time.csv"
}
