## Install Virtualbox 


### Download virtualbox.repo File

````bash
sudo wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo -P /etc/yum.repos.d/
````

Next, update the installed packages on the system and import the virtulbox public key by running the following dnf command. This ensures that all system updates are installed and that the system is running the most up-to-date kernel included in the distribution.


````bash
sudo dnf update 
````
Update Fedora Packages
Update Fedora Packages

### Installing Development Tools on Fedora 29

If you want to run the Oracle VM VirtualBox graphical user interfaces (VirtualBox), you need to install Qt and SDL packages. However, if you only want to run VBoxHeadless, the aforementioned packages aren’t required.

In addition, the installer will create kernel modules on the system, therefore you need to install development tools (GNU compiler (GCC), GNU Make (make)) and packages containing header files for your kernel for the build process as well.

````bash
 sudo dnf install @development-tools
 sudo dnf install kernel-devel kernel-headers dkms qt5-qtx11extras  elfutils-libelf-devel zlib-devel
````

Installing VirtualBox 6.0 on Fedora 29
Once the required packages and development tools installed, you can now install VirtualBox 6.0 with the following dnf command.

```bash
dnf install VirtualBox-6.0
```

Install Virtualbox in Fedora

During the VirtualBox package installation, the installer created a group called vboxusers, all system users who are going to use USB devices from Oracle VM VirtualBox guests must be a member of that group.

To add a user to that group, use the following usermod command.

````bash
sudo usermod -a -G vboxusers ($user)
````

At this point, you are ready to start using VirtualBox on your Fedora 29. Search for VirtualBox in the Activities search feature and click on it to launch it.

Alternatively, execute the following command to start VirtualBox from the terminal.

