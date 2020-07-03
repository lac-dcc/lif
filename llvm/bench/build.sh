#!/usr/bin/env bash

source yaml.sh

# Takes the path to a benchmark and generates executables for: (i) the original
# code; (ii) the invariant version; and (iii) the invar. & optimized version.
# We assume that the benchmark folder contains a "sources" folder with a list
# of source files to be transformed.
build::single() {
    local bench=$1
    local sources=${bench}/sources
    local llvmir=${bench}/llvm-ir
    local asm=${bench}/asm
    local bin=${bench}/bin

    # Create folders if they don't exist.
    mkdir -p $llvmir $asm $bin

    # Parse the meta.yaml containing the name of the functions, sources and
    # libs to link.
    local -A meta
    yaml::parse ${bench}/meta.yaml meta

    local -a srcs=(${meta[sources]//,/ })
    for src in ${srcs[@]}; do
        # Get rid of the language extension so we can use the src name.
        local srcname=$(echo $src | sed "s/\.[^.]*$//")

        # Compile the src file.
        clang -emit-llvm -S -Xclang -disable-O0-optnone \
            "${sources}/${src}" -o "${llvmir}/${srcname}.ll";

        local -a libs=${meta[libs]//,/ }
        for lib in ${libs[@]}; do
            local teste=$(echo $lib | sed "s/\.[^.]*$//")

            # Compile the lib & link it with src
            clang -emit-llvm -S -Xclang -disable-O0-optnone \
                "${sources}/${lib}" -o "${llvmir}/${libname}.ll";

            llvm-link -S ${llvmir}/${srcname}.ll ${llvmir}/${libname}.ll \
                -o ${llvmir}/${srcname}.ll

            # Now the lib code is inside src.ll, so we can remove it to save
            # space.
            rm ${llvmir}/${libname}.ll
        done

        # Try to completely unroll existing loops.
        opt -S -mem2reg -simplifycfg -loops -lcssa -loop-simplify -loop-rotate \
            -indvars -loop-unroll -unroll-count=5000 -unroll-threshold=5000 \
            "${llvmir}/${srcname}.ll" -o "${llvmir}/${srcname}.ll";

        # Apply optimizations (level 2).
        opt -S -O2 "${llvmir}/${srcname}.ll" -o "${llvmir}/${srcname}_opt.ll"

        # Run the invariant tool without optimizations & with optimizations.
        ../bin/lif -insert-len -O0 -names=${meta[functions]} \
            "${llvmir}/${srcname}.ll" -o "${llvmir}/${srcname}_inv.ll"
        ../bin/lif -insert-len -O2 -names=${meta[functions]} \
            "${llvmir}/${srcname}.ll" -o "${llvmir}/${srcname}_invopt.ll"

        # Generate the assembly files.
        llc -filetype=asm "${llvmir}/${srcname}.ll" \
            -o "${asm}/${srcname}.s"
        llc -filetype=asm "${llvmir}/${srcname}_opt.ll" \
            -o "${asm}/${srcname}_opt.s"
        llc -x86-cmov-converter=false -filetype=asm "${llvmir}/${srcname}_inv.ll" \
            -o "${asm}/${srcname}_inv.s"
        llc -x86-cmov-converter=false -filetype=asm "${llvmir}/${srcname}_invopt.ll" \
            -o "${asm}/${srcname}_invopt.s"

        # Generate the exec. for each assembly file.
        clang -g "${asm}/${srcname}.s" -o "${bin}/${srcname}" -no-pie
        clang -g "${asm}/${srcname}_opt.s" -o "${bin}/${srcname}_opt" -no-pie
        clang -g "${asm}/${srcname}_inv.s" -o "${bin}/${srcname}_inv" -no-pie
        clang -g "${asm}/${srcname}_invopt.s" -o "${bin}/${srcname}_invopt" -no-pie
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
