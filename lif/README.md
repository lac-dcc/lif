[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![stability-wip](https://img.shields.io/badge/stability-work_in_progress-lightgrey.svg)

## Requirements
- CMake >= 3.18.4
- LLVM >= 13.0.0
- Clang >= 13.0.0
- A generator for CMake (GNU Make, Ninja, etc)

## Build
This project is built with CMake. You can choose the generator you prefer. You
also need to set the path for the LLVM install directory. The following
commands illustrate the building process:

```
$ cd /path/to/lif/
$ cmake -DLLVM_INSTALL_DIR="/usr" -G Ninja -B build/ .
$ ninja -C build
```

## Usage
`$ bin/lif [options] <Module to be transformed> -o <Module after the transformations>`

First, you need to generate an LLVM IR representation of some source code. 
For that, you can proceed as follows:

#### **`comp.c`**
``` c
#include <stdio.h>

int comp(int *a, int *b, int n) {
    for (int i = 0; i < n; i++) {
        // "b" is secret => conditional is tainted
        if (a[i] != b[i]) return 0;
    }
    return 1;
}

int main() {
    int a[4] = {0, 0, 0, 0};
    // Define array "b" as secret
    __attribute__((annotate("secret"))) int b[4] = {0, 0, 0, 0};
    printf("%d\n", comp(a, b, 4));
    return 0;
}
```

```
$ clang -S -emit-llvm -Xclang -disable-O0-optnone comp.c -o comp.ll
```

## Options
- `o=<bitcode filepath>`: Transformed module
- `O<0..3>`: Optimization level
