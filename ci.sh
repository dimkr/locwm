#!/bin/sh -xe

meson --warnlevel=2 --buildtype=release build
DESTDIR=/tmp/out ninja -C build install
