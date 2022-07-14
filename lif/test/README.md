[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![stability-wip](https://img.shields.io/badge/stability-work_in_progress-lightgrey.svg)

# Test Framework

We implemented a test framework to check if the transformed programs are
correct. The benchmarks can be found at the folder `benchmarks/`. There's
a list with the paths of all benchmarks in the file `benchmarks.txt`.
The test framework is implemented in `Clojure`, with the help of
[`babashka`](https://github.com/babashka/babashka). We're currently using
versions 1.10.3.1040 of Clojure and 0.3.7 of babashka.

The scrip accepts a flag `--help` that shows detailed information on
how to use it:

``` sh
$ bb run.clj --help
```

To compile a single benchmark:

``` sh
$ bb run.clj compile -b path/to/benchmark
```

To run a single benchmark and check its output:

``` sh
$ bb run.clj verify -b path/to/benchmark
```

To compile and run at the same time:

``` sh
$ bb run.clj both -b path/to/benchmark
```

To perform an action on every benchmark listed in a file:

``` sh
$ bb run.clj <action> -f benchmarks.txt
```

The folder of every benchmarks must contain:

1. A lib folder with the source code;
2. An include folder with the headers;
3. A main folder with a main.c file;
4. An input folder with n > 0 files; and
5. A config.yaml file with the tainted arguments.
