[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Project Líf
The goal of this project is the development of a technique that transforms a function into a version of it that is time and memory invariant. This property ensures that the set of instructions executed will always be the same regardless of the inputs. As a consequence, the execution time of said function will be constant. Such transformation method eliminates side-channels in implementations of cryptography.

This repository is split into two folders described above:

- `lang`: Líf lang is a small and simple language implemented in Haskell. It exists primarily with the purpose of implementing a skeleton of the invariant transformation pass.
- `llvm`: This folder contains the implementation of the invariant pass onto the LLVM environment.

## Overview
Consider the following function, which takes two lists, _A_ and _B_, and returns 1 if they are equal or 0 otherwise:

```C
int comp(int *A, int *B) {
    for (int i = 0; i < N; i++)
            if (A[i] != B[i]) return 0;
    return 1;
}
```

Let A = [0, 0, 0, 0] and B = [0, 0, 0, 0]. In this case, the loop body will be executed _N_ times. Now, let A' = [1, 0, 0, 0]. When calling `comp` with A' and B, since the first test _A[i] != B[i]_ already fails, the loop body will be executed only once and the function will then return. Hence, if _N_ is large, the execution time of this function w.r.t the first input will take longer than the execution time for the second input. This difference can, for example, be used by an external observer to retrieve informations related to those inputs.
