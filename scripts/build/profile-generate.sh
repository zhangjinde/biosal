#!/bin/bash

CFLAGS="-fprofile-generate -rdynamic -O3 -march=x86-64 -g -std=c99 -Wall -Wextra -pedantic -I. -Werror -Wno-unused-parameter -D_POSIX_C_SOURCE=200112L"
clear
echo "CFLAGS: $CFLAGS"

make clean
make CFLAGS="$CFLAGS" all -j 8
