cd Kernel
echo "Cleaning up source"
make clean && make mrproper
echo "Enter your kernel version"
read vrsn;
echo $vrsn > CURRENT_VERSION
echo "Making config"
make titanium_defconfig
echo "Adding Current Version to Kernel"
cp CURRENT_VERSION .version
echo "Building Kernel"
make -j48
echo "Kernel ready"
cp -f arch/arm/boot/zImage /home/aditya/HTC_OneV/zImage
echo "All done,Press Enter to Quit" 
read ANS
