#!/usr/bin/env bash

# Takes the path to a benchmark plus a list of functions to be transformed,
# (comma-separated string), and generates executables for: (i) the original
# code; (ii) the invariant version; and (iii) the invar. & optimized version.
# We assume that the benchmark folder contains a "sources" folder with a list
# of source files to be transformed.
build::single() {
    local bench=$1
    local fnames=$2

    local sources=${bench}/sources
    local llvmir=${bench}/llvm-ir
    local asm=${bench}/asm
    local bin=${bench}/bin

    # Create folders if they don't exist.
    mkdir -p $llvmir $asm $bin

    for src in $(ls $sources); do
        # Get rid of the language extension so we can use the src name.
        ext=$(echo $src | sed "s/.*\.//")
        name=$(echo $src | sed "s/\.[^.]*$//")

        # Compile $src file with -g (debug) flag.
        clang -g -emit-llvm -S -Xclang -disable-O0-optnone \
            "${sources}/${name}.${ext}" -o "${llvmir}/${name}.ll";
 
        # Apply optimizations and completely unroll existing loops.
        opt -S -mem2reg -simplifycfg -loops -lcssa -loop-simplify -loop-rotate \
            -indvars -loop-unroll -unroll-count=32 "${llvmir}/${name}.ll" \
            -o "${llvmir}/${name}.ll";

        # Run the invariant tool without optimizations & with optimizations.
        ../bin/lif -len-args -names=$fnames "${llvmir}/${name}.ll" \
            -o "${llvmir}/${name}_inv.ll"
        ../bin/lif -len-args -opt -names=$fnames "${llvmir}/${name}.ll" \
            -o "${llvmir}/${name}_invopt.ll"

        # Generate the assembly files.
        llc -filetype=asm "${llvmir}/${name}.ll" -o "${asm}/${name}.s"
        llc -filetype=asm "${llvmir}/${name}_inv.ll" -o "${asm}/${name}_inv.s"
        llc -filetype=asm "${llvmir}/${name}_invopt.ll" -o "${asm}/${name}_invopt.s"

        # Generate the exec. for each assembly file.
        clang "${asm}/${name}.s" -o "${bin}/${name}" -no-pie
        clang "${asm}/${name}_inv.s" -o "${bin}/${name}_inv" -no-pie
        clang "${asm}/${name}_invopt.s" -o "${bin}/${name}_invopt" -no-pie
    done
}

# Takes the name of an associative array where key is the path to a benchmark
# and value is a list of functions to be transformed for that benchmark
# (comma-separated strings).
build::all() {
    local -n benchlist_ref=$1
    for bench in ${!benchlist_ref[@]}; do
        echo "Building ${bench}"
        build::single $bench ${benchlist_ref[$bench]}
    done
    echo "Done"
}
