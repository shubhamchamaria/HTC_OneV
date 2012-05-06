echo "~TITANIUM KERNEL COMPILER~"
cd Kernel
export ARCH=arm CROSS_COMPILE=/home/aditya/Toolchain/arm-eabi-4.4.3/bin/arm-eabi-
echo "Cleaning up source"
make clean && make mrproper
echo "Enter your kernel version"
read vrsn;
echo $vrsn > CURRENT_VERSION
echo "Making config"
make Adi_Pat_defconfig
echo "Adding Current Version to Kernel"
cp CURRENT_VERSION .version
echo "Building Kernel"
make -j84
echo "Kernel ready"
cp -f arch/arm/boot/zImage /home/aditya/HTC_OneV/zImage
echo "Copying modules"
cp Kernel/drivers/net/wireless/bcmdhd/bcmdhd.ko /home/aditya/HTC_OneV/Ramdisk/lib/modules/bcmdhd.ko
cp Kernel/drivers/net/kineto_gan.ko /home/aditya/HTC_OneV/Ramdisk/lib/modules/kineto_gan.ko
cp Kernel/fs/cifs/cifs.ko /home/aditya/HTC_OneV/Ramdisk/lib/modules/cifs.ko
cp Kernel/drivers/net/tun.ko /home/aditya/HTC_OneV/Ramdisk/lib/modules/tun.ko
cd /home/aditya/HTC_OneV/Ramdisk/lib/modules/

for i in $(find . | grep .ko | grep './')
do
        echo $i
/home/aditya/Toolchain/arm-2011.03/bin/arm-none-eabi-strip --strip-unneeded $i

done

echo "Stripped Modules"
echo "All done,Press Enter to Quit" 
read ANS
