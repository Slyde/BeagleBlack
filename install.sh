#!/bin/bash

echo ""
echo "**********************************************************"
echo "Welcome to Slyd3 project !!"
echo "This script will download and install all the needed files"
echo "**********************************************************"


echo "**********************************************************"
echo "Step 1 : Creating the folder structure"
echo "**********************************************************"
mkdir -p kernel apps rootfs sysroot toolchain apps/install
cd rootfs
mkdir -p bin etc home lib sbin share usr var 
mkdir -p etc/init.d etc/network usr/bin usr/sbin usr/share var/run 
cd ..
echo "**********************************************************"
echo "Done"
echo "**********************************************************"

echo "**********************************************************"
echo "Step 2 : Linaro toolchain"
echo "**********************************************************"
cd toolchain
wget https://launchpad.net/linaro-toolchain-binaries/trunk/2013.06/+download/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux.tar.bz2
tar xjvf gcc-linaro-arm-linux-gnueabihf-4.8.2013.06_linux.tar.bz2
cp gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/arm-linux-gnueabihf/libc/* ../sysroot/
cd ..
echo "**********************************************************"
echo "Done"
echo "**********************************************************"

echo "**********************************************************"
echo "Step 3 : linux kernel"
echo "**********************************************************"
git clone https://github.com/beagleboard/kernel.git
cd kernel
git checkout 3.8
./patch.sh
wget http://arago-project.org/git/projects/?p=am33x-cm3.git;a=tree;f=bin
mv index.html\?p\=am33x-cm3.git kernel/firmware/am335x-pm-firmware.bin
cd kernel
../../patches/kernel/apply.sh
cd ../../
echo "**********************************************************"
echo "Done"
echo "**********************************************************"

echo "**********************************************************"
echo "Step 4 : busybox"
echo "**********************************************************"
cd apps
git clone git://git.busybox.net/busybox
cd busybox
git checkout 1_21_stable
cd ..
echo "**********************************************************"
echo "Done"
echo "**********************************************************"

 
