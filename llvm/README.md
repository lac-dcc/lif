[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![stability-wip](https://img.shields.io/badge/stability-work_in_progress-lightgrey.svg)

# Lif - LLVM
This is an implementation of the Isochronous Pass onto the LLVM ecossystem. It
relies on the new LLVM Pass Manager. Unfortunately, so far the official
documentation is directed to the legacy Pass Manager, but you can find nice
talks about the new Pass Manager on youtube. We recommend the following talk
from Andrzej Warzynski:

[![New LLVM Pass Manager](https://img.youtube.com/vi/ar7cJl2aBuU/0.jpg)](https://www.youtube.com/watch?v=ar7cJl2aBuU "2019 LLVM Developers’ Meeting: A. Warzynski “Writing an LLVM Pass: 101”")

## Requirements
- CMake >= 3.18.4
- LLVM >= 10.0.1 (you can use your LLVM's system package, no need to build it manually)
- Clang >= 10.0.1
- A generator for CMake (GNU Make, Ninja, etc)

## Build
This project is built with CMake. You can choose the generator you prefer. You
also need to set the path for the LLVM install directory. The following
commands illustrate the building process:

```
$ cd /path/to/lif/llvm
$ cmake -DLT_LLVM_INSTALL_DIR="/usr" -G Ninja -B build/ .
$ ninja -C build
```

## Usage
`$ lif [options] <Module to be transformed> -o <Module after the transformations>`

First, you need to generate an LLVM IR representation of some source code. For
that, you can proceed as follows:

#### **`comp.c`**
``` c
#include <stdio.h>

int comp(int *a, int *b) {
    for (int i = 0; i < 4; i++)
      if (a[i] != b[i]) return 0;
    return 1;
}

int main() {
    int a[4] = {0, 0, 0, 0};
    int b[4] = {0, 0, 0, 0};
    printf("%d\n", comp(a, b));
    return 0;
}
```

```
$ clang -S -emit-llvm -Xclang -disable-O0-optnone comp.c -o comp.ll
```

The isochronous pass requires each loop to be fully unrolled. You can use the
option _unroll_ (together with _unroll-count_ and _unroll-threshold_, an option
for the LLVM loop-unroll pass) in order to let this trool try to unroll them,
or you can manually unroll them if you want.

```
$ bin/lif -names=comp -opt -unroll -unroll-count=4 comp.ll -o comp_inv.ll
```

## Options
- `names=<f1,f2,f3...,fn>`:  List of functions to be transformed. \[empty = all\]
- `o=<bitcode filename>`: \<Module after the transformations\>
- `O<0..3>`: Optimization level (same as opt -O\<0..3\>)
- `unroll`: Try to unroll existing loops (set unroll-count and/or
unroll-threshold = the max number of loop iterations to perform a full
unroll)
