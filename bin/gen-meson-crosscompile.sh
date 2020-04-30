#!/bin/bash

# Use environment variables defined in Yocto's SDK to populated a
# cross-compiler setup for Meson projects.

function list() {
    for thing in $*; do
        printf "'$thing', "
    done
}

function firstword() {
    echo $1
}

function notfirstword() {
    shift
    echo $*
}

# name stands for list Not First
function listnf() {
    shift
    list $(echo $*)
}

cat <<EOF
[binaries]
c = '$(firstword $CC)'
cpp = '$(firstword $CXX)'
ar = '$(firstword $AR)'
nm = '$(firstword $NM)'
ld = '$(firstword $LD)'
strip = '$(firstword $STRIP)'
pkgconfig = '$(which pkg-config)'

[host_machine]
system = 'linux'
cpu_family = 'arm'
cpu = 'armv7a'
endian = 'little'

[properties]
c_args = [$(list $CFLAGS) $(listnf $CC) '--sysroot=$SDKTARGETSYSROOT']
cpp_args = [$(list $CPPFLAGS) $(listnf $CXX) '--sysroot=$SDKTARGETSYSROOT']
c_link_args = [$(list $LDFLAGS) '--sysroot=$SDKTARGETSYSROOT']
cpp_link_args = [$(list $LDFLAGS) '--sysroot=$SDKTARGETSYSROOT']

EOF
