[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Low-level Isochronous Form
A function is said to be isochronous if its running time does not
depend on secret inputs. In other words, the function must
be invariant with respect to both operations and memory accesses.
If every sensitive function of a program is isochronous, than the
program itself is said to be isochronous. The goal of project Lif
is the development of a technique that transforms a program into
an isochronous version. This invariant property is desirable when
dealing with cryptography, given that these implementations must
be side-channel free.


This repository is split into two folders described above:

- `tiny`: A small and simple language written in Haskell. 
          It exists primarily with the purpose of implementing a
          skeleton of the isochronous pass.
- `lif`: A LLVM-based tool that implements the isochronous pass.

## Overview
Consider the following function, which takes two lists, _A_ and
_B_, and returns 1 if they are equal or 0 otherwise:

```C
int comp(int *A, int *B) {
    for (int i = 0; i < N; i++)
            if (A[i] != B[i]) return 0;
    return 1;
}
```

Let A = [0, 0, 0, 0] and B = [0, 0, 0, 0]. In this case, the loop
body will be executed _N_ times. Now, let A' = [1, 0, 0, 0]. When
calling `comp` with A' and B, since the first test _A'[i] != B[i]_
already fails, the loop body will be executed only once and the
function will then return. Hence, if _N_ is large, the execution
time of this function w.r.t. the first input will take longer
than the execution time for the second input. This difference
can be used by an external observer to retrieve informations
related to those inputs.
