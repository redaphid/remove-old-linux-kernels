#!/bin/sh
OLD_KERNELS=`dpkg -l | tail -n +6 | grep -E 'linux-image-[0-9]+' | grep -Fv $(uname -r) | awk '{print $2}'`

for kernel in $OLD_KERNELS; do
    apt-get remove -y --purge $kernel
done

apt-get autoremove -y --purge
