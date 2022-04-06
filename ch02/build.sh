#!/bin/sh

echo "Creating disk.img..."
/home/tesla/tools/bochs/bin/bximage -mode=create -hd=10M -q disk.img

# echo "Compiling..."
nasm -o mbr.bin mbr.S

# echo "Writing mbr and loader to disk..."
dd if=./mbr.bin of=./disk.img bs=512 count=1 conv=notrunc

echo "Now start bochs and have fun!"
/home/tesla/tools/bochs/bin/bochs -f ./bochsrc
