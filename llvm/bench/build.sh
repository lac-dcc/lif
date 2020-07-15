#!/usr/bin/env bash

source yaml.sh

# Take the path to a llvm IR file and the path to the output file and try to
# unroll the existing loops.
build::unroll() {
    local in=$1
    local out=$2

    opt -S -mem2reg -simplifycfg -loops -lcssa -loop-simplify -loop-rotate \
            -indvars -loop-unroll -unroll-count=1000 -unroll-threshold=1000 \
            "$in" -o "$out"
}
# Sometimes a single unroll pass does not suffice to completely unroll the
# existing loops, so we try to unroll until the new file is equal to the
# previous one.
build::full_unroll() {
    local llvmfile=$1

    # Unroll two times and check if both files are the same. If not, unroll
    # untill it stops changing.
    build::unroll "$llvmfile" "$llvmfile"
    build::unroll "$llvmfile" "unroll.ll"

    while [ $(cmp -s "$llvmfile" "unroll.ll"; echo $?) -eq 1 ]; do
        cp "unroll.ll" "$llvmfile"
        build::unroll "$llvmfile" "unroll.ll"
    done

    cp "unroll.ll" "$llvmfile"
    rm "unroll.ll"
}

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
        local -a libllvm=()

        for lib in ${libs[@]}; do
            local libname=$(echo $lib | sed "s/\.[^.]*$//")

            # Compile the lib & link it with src
            clang -emit-llvm -S -Xclang -disable-O0-optnone \
                "${sources}/${lib}" -o "${llvmir}/${libname}.ll";

            # Try to completely unroll existing loops.
            build::full_unroll "${llvmir}/${libname}.ll"

            # Try to inline the marked functions.
            # opt -S -always-inline "${llvmir}/${libname}.ll" \
                # -o "${llvmir}/${libname}.ll"

            libllvm+=("${llvmir}/${libname}.ll")
        done

        # Link the src file with all required libs.
        llvm-link -S ${llvmir}/${srcname}.ll ${libllvm[@]} \
            -o ${llvmir}/${srcname}.ll

        # Now the lib code is inside src.ll, so we can remove it to save
        # space.
        rm ${libllvm[@]}

        # Apply optimizations (level 1).
        opt -S -O1 "${llvmir}/${srcname}.ll" -o "${llvmir}/${srcname}_opt.ll"

        # Run the invariant tool without optimizations & with optimizations.
        ../bin/lif -O0 -names=${meta[functions]} \
            "${llvmir}/${srcname}.ll" -o "${llvmir}/${srcname}_inv.ll"
        ../bin/lif -O1 -names=${meta[functions]} \
            "${llvmir}/${srcname}.ll" -o "${llvmir}/${srcname}_invopt.ll" \
            &> /dev/null

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

        # Compare the output to ensure they are all the same (i.e. the
        # transformed code is correct). Assume that orig_opt is correct
        # (since is obtained from the llvm opt pipeline).
        local orig=$("${bin}/${srcname}")
        local inv=$("${bin}/${srcname}_inv")
        local inv_opt=$("${bin}/${srcname}_invopt")

        printf "${srcname} "
        if [[ "$orig" == "$inv" && "$orig" == "$inv_opt" ]]; then
            echo -e "\033[0;32m[pass]\033[0m"
        else
            echo -e "\033[0;31m[fail]\033[0m"
        fi;
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
