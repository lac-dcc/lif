[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![stability-wip](https://img.shields.io/badge/stability-work_in_progress-lightgrey.svg)

# Líf - LLVM
This is an implementation of the Invariant Pass onto the LLVM ecossystem. It relies on the new LLVM Pass Manager. Unfortunately, so far the official documentation is directed to the legacy Pass Manager, but you can find nice talks about the new Pass Manager on youtube. I recommend the following talk from Andrzej Warzynski:

[![New LLVM Pass Manager](https://img.youtube.com/vi/ar7cJl2aBuU/0.jpg)](https://www.youtube.com/watch?v=ar7cJl2aBuU "2019 LLVM Developers’ Meeting: A. Warzynski “Writing an LLVM Pass: 101”")

## Requirements
- CMake >= 3.4.3
- LLVM >= 10.0.0 (you can use your LLVM's system package, no need to build it manually)
- Clang >= 10.0.0
- A generator for CMake (GNU Make, Ninja, etc)

## Build
This project is built with CMake. You can choose the generator you prefer. You also need to set the path for the LLVM install directory. It is assumed that the following paths exist: $LT_LLVM_INSTALL_DIR/include/llvm for the LLVM installation and $LT_LLVM_INSTALL_DIR/lib/cmake/llvm/LLVMConfig.cmake for the LLVM config file. However, if you prefer, you can set these paths manually by modifying the CMakeLists.txt file at the root folder. The following commands exemplifies the building process:

```
$ cd /path/to/lif/llvm
$ cmake -DLT_LLVM_INSTALL_DIR="/usr" -G Ninja .
$ ninja
```

## Usage
First, you need to generate a LLVM IR representation of some source code. For that, you can proceed as follows:

```
$ clang -S -emit-llvm -Xclang -disable-O0-optnone example.c -o example.ll
$ opt -S -mem2reg example.ll -o example.ll
```

Then, use opt to load the invariant pass:

```
$ opt -load-pass-plugin lib/libInvariant.so -passes="invar" example.ll -o invar.ll
```
