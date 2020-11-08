# Test Framework

## Requirements
In order to properly use the scripts defined here, to evaluate
the performance and correctness of the Lif tool, you will need to
install a few python libraries. You can use *pip* for that:

```
$ pip install numpy==1.19.4 \
$             pandas==1.1.4 \
$             matplotlib==3.3.2 \
$             seaborn==0.11.0 \
$             pyyaml==5.3.1
```

## Instructions
This folder contain benchmarks and scripts that can be used to
evaluate the performance and correctness of the Lif tool. There
is a synthetic benchmark (comp) as well as real benchmarks picked
from [CTBench](https://github.com/arthurlopes/ctbench) and [Meng
et al.'s artifact](https://zenodo.org/record/1299357).
Additionally, the *mu* benchmark consists of a function used as
example by Meng et al. in the paper "Eliminating Timing
Side-Channel Leaks using Program Repair"

The main script is *run.sh*. It can be used as follows:

```
$ cd path/to/lif/llvm/bench
$ /bin/bash run.sh -a
```

This command will build and collect data about all the
benchmarks. The script also accepts the path to a single
benchmark, in case you want to build and collect info
individually. For example:

```
$ cd path/to/lif/llvm/bench
$ /bin/bash run.sh -a meng/applied-crypto/3way
```

When building a benchmark, there will be three types of outputs
for both our isochronous pass and Meng et al.'s transformation:

- **Pass**: the output of the original program is equivalent to
    the output of the transformed code.
- **Fail**: the output of the transformed code is different
    (incorrect).
- **LLVM Error**: the transformation could not be applied
    (crashed).

You can also run the build (-b) and collect (-c) steps
separetely.  The collect step produces information about the
execution time of both the program and the transformation pass
and the size of the modified code. It also uses *cachegrind* (a
tool from [Valgrind](https://valgrind.org/)) to collect data
about the read/write hits and misses for both instructions and
data. This can be used to check if the produced code is indeed
isochronous.  Furthermore, The *run.sh* also accepts a *-p*
option to plot the data collected from the benchmarks. For more
information, run `/bin/bash run.sh -h`.
