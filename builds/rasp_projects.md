### Using Rasberry Pi Builds

+ Testing Raspberry PI Builds (raspberry pi build testing)[https://azeria-labs.com/emulate-raspberry-pi-with-qemu/]install

QEMU is a generic and open source machine emulator and virtualizer, while using it as a machine emulator it can run OSes and programs. QEMU is a hosted virtual machine monitor: it emulates CPUs through dynamic binary translation and provides a set of device models, enabling it to run a variety of unmodified guest operation systems. it also can be used together with KVM in order to run virtual machines at near-native speed. Moreover, QEMU can also be used purely for CPU emulation for user-level processes, allowing applications compiled for one architecture to be run on another.



## Downloading

Installation is pretty easy… either you can build from source or install it directly from you distribution’s source. On Ubuntu terminal do:

````bash
sudo apt-get install qemu-system-arm
sudo qemu-system-arm — version
````
your output should be like

QEMU emulator version 2.5.50, Copyright © 2003–2008 Fabrice Bellard

You should now have a working QEMU install.
Prepare to boot

Qemu requires kernel and device tree file to be given as parameters, because of that we have to extract those pieces from existing Raspbian image. So first at all create a working directory in which we will download the necessary files. I did it on”~/work/rpi”

Get Kernel and device tree

You can simply download the latest Raspbian distribution from RaspberryPi.org.
````bash
sudo wget http://downloads.raspberrypi.org/raspbian/images/raspbian-2016-11-29/2016-11-25-raspbian-jessie.zip
sudo unzip 2016–11–25-raspbian-jessie.zip
#rename it to rpi.img
sudo mv 2016–11–25-raspbian-jessie.img rpi.img
````
we will need to modify the raspbian image.
first,check the filesystem table with fdisk

```bash
$ fdisk -lu rpi.img
```

Disk rpi.img: 3.9 GiB, 4127195136 bytes, 8060928 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x3e7fd08e
Device Boot Start End Sectors Size Id Type
rpi.img1 8192 131071 122880 60M c W95 FAT32 (LBA)
rpi.img2 131072 8060927 7929856 3.8G 83 Linux
The important note to take from the above output is:
Sector size: 512
start block: img1: 8192 and img2: 131072
The partition that interests us here is the second one (rpi.img1), this is the main partition. It starts on sector 131072.

````bash
mkdir tmp
sudo mount -o loop,offset=$((512*131072)) rpi.img tmp
```

then, Use your favorite editor to change tmp/etc/fstab. Note that you have to edit as superuser. indeed, the SD card is in /dev/mmcblk0p* on a Raspberry pi, using QEMU the image is going to be in /dev/sda. Just commend on these two lines:

#/dev/mmcblk0p1 /boot vfat defaults 0 2
#/dev/mmcblk0p2 / ext4 errors=remount-ro,noatime,nodiratime,commit=120 0 1

## QEMU-Ready Raspberry Pi Kernel

You can download the QEMU-Ready R-Pi’s kernel from here. Or you can simply clone the git repository in the directory that you just created using the command below:
$ git clone https://github.com/dhruvvyas90/qemu-rpi-kernel.git

Preparing the setup phase
So, If you have done everything correctly your working folder should contain these files and folders

Next, you need to make a simple script (to make it easier to start the emulator…believe me it is going to be a long command!). So open up your favorite text editor and save the content below as a new file in the workspace and name it config

````bash
#!/bin/bash
# Starts raspberry pi image in configuration mode
qemu-system-arm -kernel ./qemu-rpi-kernel/kernel-qemu-4.4.26-jessie -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw init=/bin/bash" -hda rpi.img
````

After saving the file, make sure you make it executable by the command below:
````bash
$ chmod +x config
$ ./config
````

to avoid the crash you have to comment tmp/etc/ld.so.preload.
Changing ld.so.preload
First calculate offset in bytes to Raspbian root filesystem partition. According to fdisk output above partition starts with sector 131072
sudo mount -o loop,offset=$((512*131072)) rpi.img tmp
Use your favorite editor to change tmp/etc/ld.so.preload. Note that you have to edit as superuser. Content of file should looks like this:

#/usr/lib/arm-linux-gnueabihf/libarmmem.so

Now you should define some rules to tell raspberry pi how to direct calls to SD-Card to the “sda” storage we have defined in the config script. To do so, you need to make a new rule in udev rules. Create a new rule by following command:
$ nano tmp/etc/udev/rules.d/90-qemu.rules
It makes a new file named 90-qemu.rules in /etc/udev/rules.d folder. Type in the following directives in the new file:
KERNEL==”sda”, SYMLINK+=”mmcblk0"
KERNEL==”sda?”, SYMLINK+=”mmcblk0p%n”
KERNEL==”sda2", SYMLINK+=”root”
Sync and umount partition:
sync
sudo umount tmp
Final booting
now you have to make another script and name it fconfig but this time put the following content in the script, save and finally make it executable.
#!/bin/bash

# Start the Raspberry Pi in fully functional mode!

````code
qemu-system-arm -kernel ./qemu-rpi-kernel/kernel-qemu-4.4.26-jessie -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" -hda rpi.img
````

Summary
The QEMU emulation allow you to get a good ieda of the distribution. Of course,there are some missing details to improve the utilization of this tool. But even at this stage it is helpful and beneficial.
