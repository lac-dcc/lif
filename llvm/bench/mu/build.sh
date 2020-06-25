sources=("mu1" "mu2")

for src in "${sources[@]}"; do
    # Compile $src file with -g (debug) flag.
    clang -g -emit-llvm -S -Xclang -disable-O0-optnone "$src".c -o "$src".ll;

    # Apply optimizations and completely unroll existing loops.
    opt -S -mem2reg -indvars -simplifycfg -loops -lcssa --loop-simplify \
        --loop-rotate --loop-unroll --unroll-count=32 "$src".ll -o "$src".ll;

    # Apply the invariant pass & some optimizations.
    opt -S -load-pass-plugin ../../lib/libInvariant.so -passes="module(len-args),function(invar)" \
        "$src".ll -o "$src"_inv.ll;
    opt -S -mem2reg -constprop -gvn -dce "$src"_inv.ll -o "$src"_inv_opt.ll;

    # Generate object files for: (i) the original file; (ii) the invar. version;
    # and (iii) the invariant & optimized version.
    llc -filetype=obj "$src".ll -o "$src".o
    llc -filetype=obj "$src"_inv.ll -o "$src"_inv.o
    llc -filetype=obj "$src"_inv_opt.ll -o "$src"_inv_opt.o

    # Generate the exec. for each object file.
    clang "$src".o -o "$src" -no-pie
    clang "$src"_inv.o -o "$src"_inv -no-pie
    clang "$src"_inv_opt.o -o "$src"_inv_opt -no-pie

    # Run cachegrind on each generated executable in order to check the number
    # of instructions executed, and measure cache-hits and cache-misses. We
    # define the config for both the L1 and LL caches as: 128 B, 32 B per line,
    # and associativity = 2.
    valgrind --tool=cachegrind --I1=128,2,32 --D1=128,2,32 --LL=128,2,32 \
        --cachegrind-out-file="$src"_tmp.cachegrind ./"$src"
    valgrind --tool=cachegrind --I1=128,2,32 --D1=128,2,32 --LL=128,2,32 \
        --cachegrind-out-file="$src"_inv_tmp.cachegrind ./"$src"_inv
    valgrind --tool=cachegrind --I1=128,2,32 --D1=128,2,32 --LL=128,2,32 \
        --cachegrind-out-file="$src"_inv_opt_tmp.cachegrind ./"$src"_inv_opt

    cg_annotate --show=Ir,Dr,D1mr,Dw,D1mw --threshold=0 --auto=yes \
        "$src"_tmp.cachegrind > "$src".cachegrind
    cg_annotate --show=Ir,Dr,D1mr,Dw,D1mw --threshold=0 --auto=yes \
        "$src"_inv_tmp.cachegrind > "$src"_inv.cachegrind
    cg_annotate --show=Ir,Dr,D1mr,Dw,D1mw --threshold=0 --auto=yes \
        "$src"_inv_opt_tmp.cachegrind > "$src"_inv_opt.cachegrind
done

# Remove temporary files.
rm *.o
rm *_tmp.cachegrind
