#!/bin/bash

modprobe -r ec_sys
modprobe ec_sys write_support=1

D=/sys/kernel/debug/ec/ec0/io
while true; do
  for C in "\x8a" "\x0a"; do
    echo -ne $C | dd of=$D bs=1 seek=12 count=1 conv=notrunc status=none
    sleep 0.01
  done
  sleep 0.98
done

