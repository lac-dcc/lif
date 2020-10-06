#!/usr/bin/env bash

source parse.sh

# Takes the path to a benchmark and generates executables for: (i) the original
# code; (ii) the isochronous version; and (iii) the isochr. & optimized version.
# We assume that the benchmark folder contains a "sources" folder with a list
# of source files to be transformed.
build::single() {
    local bench=$1
    local sources=${bench}/src
    local libraries=${bench}/lib
    local llvmir=${bench}/llvm-ir
    local asm=${bench}/asm
    local bin=${bench}/bin

    # Create folders if they don't exist.
    mkdir -p $llvmir $asm $bin

    # Parse the meta.yaml containing the name of the functions to transform.
    local -A meta
    parse::yaml ${bench}/meta.yaml meta

    # Get the src & lib files.
    local -a srcs=($(ls $sources | grep "main"))
    local -a libs=($(ls $libraries))

    for src in ${srcs[@]}; do
        # Get rid of the language extension so we can use the src name.
        local srcname=$(echo $src | sed "s/\.[^.]*$//")
        printf "$srcname "

        # Compile the src file.
        clang -emit-llvm -S -Xclang -disable-O0-optnone \
            "${sources}/${src}" -o "${llvmir}/${srcname}.ll";

        local -a libllvm=()
        for lib in ${libs[@]}; do
            local libname=$(echo $lib | sed "s/\.[^.]*$//")

            # Compile the lib to link it with src.
            clang -emit-llvm -S -Xclang -disable-O0-optnone \
                "${libraries}/${lib}" -o "${llvmir}/${libname}.ll";

            libllvm+=("${llvmir}/${libname}.ll")
        done

        # Link the src file with all required libs.
        llvm-link -S ${llvmir}/${srcname}.ll ${libllvm[@]} \
            -o ${llvmir}/${srcname}.ll

        # Modify every loop to be rotated and in the canonical form.
        opt -S -mem2reg -lowerswitch -loop-simplify -loop-rotate \
            -rotation-max-header-size=1000 \
            "${llvmir}/${srcname}.ll" -o "${llvmir}/${srcname}.ll"
        printf "."

        # Now the lib code is inside src.ll, so we can remove it to save
        # space.
        rm ${libllvm[@]}

        # Apply optimizations (level 1).
        opt -S -O1 "${llvmir}/${srcname}.ll" -o "${llvmir}/${srcname}.opt.ll"
        printf "."

        # Run the isochronous tool without optimizations & with optimizations.
        ../bin/lif -O0 -names=${meta[functions]} \
            "${llvmir}/${srcname}.ll" -o "${llvmir}/${srcname}_isochr.ll" \
            &> /dev/null
        printf "."

        opt -S -O1 "${llvmir}/${srcname}_isochr.ll" -o \
            "${llvmir}/${srcname}_isochr.opt.ll"
        printf "."

        # Generate the assembly files.
        llc -filetype=asm "${llvmir}/${srcname}.ll" \
            -o "${asm}/${srcname}.s"
        printf "."

        llc -filetype=asm "${llvmir}/${srcname}.opt.ll" \
            -o "${asm}/${srcname}.opt.s"
        printf "."

        llc -x86-cmov-converter=false -filetype=asm "${llvmir}/${srcname}_isochr.ll" \
            -o "${asm}/${srcname}_isochr.s"
        printf "."

        llc -x86-cmov-converter=false -filetype=asm "${llvmir}/${srcname}_isochr.opt.ll" \
            -o "${asm}/${srcname}_isochr.opt.s"
        printf "."

        # Generate the exec. for each assembly file.
        clang -g "${asm}/${srcname}.s" -o "${bin}/${srcname}" -no-pie
        printf "."
        clang -g "${asm}/${srcname}.opt.s" -o "${bin}/${srcname}.opt" -no-pie
        printf "."
        clang -g "${asm}/${srcname}_isochr.s" -o "${bin}/${srcname}_isochr" -no-pie
        printf "."
        clang -g "${asm}/${srcname}_isochr.opt.s" -o "${bin}/${srcname}_isochr.opt" -no-pie
        printf "."

        # Compare the output to ensure they are all the same (i.e. the
        # transformed code is correct).
        local orig=$("${bin}/${srcname}.opt")
        local isochr=$("${bin}/${srcname}_isochr.opt")
        local meng

        # Run meng tool just so we can check its correctness as well.
        local err=$(opt -S -load util/meng.so -branch\
            "${llvmir}/${srcname}.ll" -o "meng.ll" 2>&1)
        printf "."

        # Grep return zero if found, nonzero otherwise.
        echo $err | grep -q "LLVM ERROR"
        local success=$?
        if [ $success -ne 0 ]; then
            mv "meng.ll" "${llvmir}/${srcname}_meng.ll"
            opt -S -O1 "${llvmir}/${srcname}_meng.ll" -o \
                "${llvmir}/${srcname}_meng.ll"
            printf "."

            llc -x86-cmov-converter=false -filetype=asm\
                "${llvmir}/${srcname}_meng.ll" -o "${asm}/${srcname}_meng.s"
            printf "."

            clang -g "${asm}/${srcname}_meng.s" \
                -o "${bin}/${srcname}_meng" -no-pie
            meng=$("${bin}/${srcname}_meng")
            printf "."
        fi

        printf ". "
        if [[ "$orig" == "$isochr" ]]; then
            printf "\033[0;32m[pass]\033[0m"
        else
            printf "\033[0;31m[fail]\033[0m"
        fi;

        if [ $success -eq 0 ]; then
            echo -e " meng=\033[0;31m[LLVM ERROR]\033[0m"
        elif [[ "$orig" == "$meng" ]]; then
            echo -e " meng=\033[0;32m[pass]\033[0m"
        else
            echo -e " meng=\033[0;31m[fail]\033[0m"
        fi;
    done

    # File names with prefix "measure" refer to source files used to measure
    # execution time of the benchmark.
    srcs=($(ls $sources | grep "measure"))
    local -a measure=(${meta[measure]//,/ })

    for src in ${srcs[@]}; do
        # Get rid of the language extension so we can use the src name.
        local srcname=$(echo $src | sed "s/\.[^.]*$//")

        # These measure files rely on a constant N to be the size of the input,
        # so we compile the benchmark for size in range [32, 1024], with step 32:
        for size in $(seq ${measure[0]} ${measure[1]} ${measure[2]}); do
            local fullname="${srcname}_${size}"
            printf "$srcname [$size] "
            # Compile the src file.
            clang -emit-llvm -S -Xclang -disable-O0-optnone -D_N=$size \
                "${sources}/${src}" -o "${llvmir}/${fullname}.ll";

            local -a libllvm=()
            for lib in ${libs[@]}; do
                local libname=$(echo $lib | sed "s/\.[^.]*$//")

                # Compile the lib & link it with src
                clang -emit-llvm -S -Xclang -disable-O0-optnone -D_N=$size \
                    "${libraries}/${lib}" -o "${llvmir}/${libname}.ll";

                libllvm+=("${llvmir}/${libname}.ll")
            done

            # Link the src file with all required libs.
            llvm-link -S ${llvmir}/${fullname}.ll ${libllvm[@]} \
                -o ${llvmir}/${fullname}.ll
            printf "."

            # Modify every loop to be rotated and in the canonical form.
            opt -S -mem2reg -lowerswitch -loop-simplify -loop-rotate \
                -rotation-max-header-size=1000 \
                "${llvmir}/${fullname}.ll" -o "${llvmir}/${fullname}.ll"
            printf "."

            # Now the lib code is inside src.ll, so we can remove it to save
            # space.
            rm ${libllvm[@]}

            # Apply optimizations (level 1).
            opt -S -O1 "${llvmir}/${fullname}.ll" \
                -o "${llvmir}/${fullname}.opt.ll"
            printf "."

            # Run the isochronous tool without optimizations & with optimizations.
            # Since Meng's tool seems to try to transform all functions within
            # a module, to be fair we don't select any specific function.
            ../bin/lif -O0 "${llvmir}/${fullname}.ll" \
                -o "${llvmir}/${fullname}_isochr.ll" &> /dev/null
            printf "."

            opt -S -O1 "${llvmir}/${fullname}_isochr.ll" -o \
                "${llvmir}/${fullname}_isochr.opt.ll"
            printf "."

            # Generate the assembly files.
            llc -filetype=asm "${llvmir}/${fullname}.ll" \
                -o "${asm}/${fullname}.s"
            printf "."

            llc -filetype=asm "${llvmir}/${fullname}.opt.ll" \
                -o "${asm}/${fullname}.opt.s"
            printf "."

            llc -x86-cmov-converter=false -filetype=asm \
                "${llvmir}/${fullname}_isochr.ll" \
                -o "${asm}/${fullname}_isochr.s"
            printf "."

            llc -x86-cmov-converter=false -filetype=asm \
                "${llvmir}/${fullname}_isochr.opt.ll" \
                -o "${asm}/${fullname}_isochr.opt.s"
            printf "."

            # Generate the exec. for each assembly file.
            clang -g "${asm}/${fullname}.s" \
                -o "${bin}/${fullname}" -no-pie
            printf "."

            clang -g "${asm}/${fullname}.opt.s" \
                -o "${bin}/${fullname}.opt" -no-pie
            printf "."

            clang -g "${asm}/${fullname}_isochr.s" \
                -o "${bin}/${fullname}_isochr" -no-pie
            printf "."

            clang -g "${asm}/${fullname}_isochr.opt.s" \
                -o "${bin}/${fullname}_isochr.opt" -no-pie
            printf "."

            # Run meng's tool with and without optimizations.
            local err=$(opt -S -load util/meng.so -branch\
                "${llvmir}/${fullname}.ll" -o "meng.ll" 2>&1)

            echo $err | grep -q "LLVM ERROR"
            local success=$?
            if [ $success -ne 0 ]; then
                mv "meng.ll" "${llvmir}/${fullname}_meng.ll"
                opt -S -O1 "${llvmir}/${fullname}_meng.ll" \
                    -o "${llvmir}/${fullname}_meng.opt.ll"

                llc -x86-cmov-converter=false -filetype=asm \
                    "${llvmir}/${fullname}_meng.ll" \
                    -o "${asm}/${fullname}_meng.s"
                printf "."

                llc -x86-cmov-converter=false -filetype=asm \
                    "${llvmir}/${fullname}_meng.opt.ll" \
                    -o "${asm}/${fullname}_meng.opt.s"
                printf "."

                clang -g "${asm}/${fullname}_meng.s" \
                    -o "${bin}/${fullname}_meng" -no-pie
                printf "."

                clang -g "${asm}/${fullname}_meng.opt.s" \
                    -o "${bin}/${fullname}_meng.opt" -no-pie
                printf "."
            fi

            echo "."
        done
    done
}

# Takes the an array of benhcmarks (paths) to be transformed.
build::all() {
    local -n benchs_ref=$1
    for bench in ${benchs_ref[@]}; do
        echo "Building ${bench}"
        build::single "$bench"
    done
    echo "Done"
}
