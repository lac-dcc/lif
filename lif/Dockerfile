FROM archlinux:latest

# Set the working directory.
WORKDIR /lif/llvm

# Update the package list.
RUN pacman -Syu --noconfirm

# Specify clang and llvm versions that shall be downloaded from
# the archlinux archived repositories.
ARG CLANG=clang/clang-10.0.1-1-x86_64.pkg.tar.zst
ARG LLVM_LIBS=llvm10-libs/llvm10-libs-10.0.1-1-x86_64.pkg.tar.zst
ARG LLVM=llvm10/llvm10-10.0.1-1-x86_64.pkg.tar.zst

# Install the specified versions of llvm and clang.
RUN pacman -U \
    https://archive.archlinux.org/packages/${CLANG} \
    --noconfirm
RUN pacman -U \
    https://archive.archlinux.org/packages/${LLVM_LIBS} \
    --overwrite "usr/lib/libLLVM-10*.so" \
    --overwrite "usr/lib/libLTO.so.10" \
    --overwrite "usr/lib/libRemarks.so.10" \
    --noconfirm
RUN pacman -U \
    https://archive.archlinux.org/packages/${LLVM} \
    --noconfirm

# Install packages needed for running the scripts. Also install
# vim in case someone wants to read/edit the scripts inside the
# container.
RUN pacman -S diffutils valgrind vim --noconfirm
RUN pacman -S python-pip --noconfirm && \
    pip install numpy==1.19.4 \
                pandas==1.1.4 \
                matplotlib==3.3.2 \
                seaborn==0.11.0 \
                pyyaml==5.3.1

# Copy the Lif tool binary and the bench folder with the
# benchmarks and scripts.
COPY bin/lif bin/lif
COPY bench/ bench/

# Make the run.sh executable.
WORKDIR bench
RUN chmod +x run.sh

# The default CMD is to build and collet data for every
# benchmark, then plot the results.
CMD ["/bin/bash", "-c", "./run.sh -a && ./run.sh -p"]
