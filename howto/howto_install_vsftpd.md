# How to Install VSFTPD

## FTP (File Transfer Protocol) 

FTP is the most common method of uploading files to a server. A wide array of FTP servers, such as vsftpd, and clients exist for every platform.

## Install vsftpd

Install vsftpd package.

> $ sudo dnf install -y vsftpd

Enable upload by local user. Enable read by anonymous user. Disable upload by anonymous user.

```
$ cat <<EOF | sudo tee /etc/vsftpd/vsftpd.conf
listen=YES
local_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
pam_service_name=vsftpd
```


# Enable upload by local user.

> write_enable=YES

# Enable read by anonymous user (without username and password).

```
$ cat <<EOF | sudo tee /etc/vsftpd/vsftpd.conf
listen=YES
local_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
pam_service_name=vsftpd
anonymous_enable=YES
anon_root=/var/ftp
no_anon_password=YES
EOF
```

## Put file to anon_chroot directory.

```
$ echo "anon" | sudo tee /var/ftp/anon.txt
Open FTP port.
```

```
$ sudo firewall-cmd --add-service=ftp --permanent
$ sudo firewall-cmd --reload
```
> Enable and restart vsftpd.

```
$ sudo systemctl enable vsftpd
$ sudo systemctl restart vsftpd
```

## Access to vsftpd

Access to vsftpd with lftp.

> $ sudo dnf install -y lftp

Access to vsftpd with specifying user. You can specify password with -u <username>,<password>. Home directory is displayed. You can access directory and files of FTP server with using user permission.

```
$ lftp -u hiroom2 ftp-server.hiroom2.com
Password:
lftp hiroom2@ftp-server.hiroom2.com:~> pwd
ftp://hiroom2@ftp-server.hiroom2.com/%2Fhome/hiroom2
lftp hiroom2@ftp-server.hiroom2.com:~> ls /
drwxr-xr-x    2 0        0            4096 Jul 29 07:12 bin
drwxr-xr-x    4 0        0            1024 Aug 05 12:16 boot
drwxrwxr-x    2 0        0            4096 Oct 09  2016 cdrom
-rw-------    1 0        0        17711104 Jan 21  2017 core
drwxr-xr-x   21 0        0            4020 Aug 06 01:22 dev
drwxr-xr-x  133 0        0           12288 Aug 06 01:22 etc
drwxr-xr-x    4 0        0            4096 Aug 06 01:22 home
```

Not specifying user uses anonymous user. The directory which is set to anon_root is displayed. Anonymous user cannot access upper directory because vsftpd uses chroot.

```
$ lftp ftp-server.hiroom2.com
lftp ftp-server.hiroom2.com:~> pwd
ftp://ftp-server.hiroom2.com
lftp ftp-server.hiroom2.com:~> ls /
-rw-r--r--    1 0        0               5 Aug 06 01:22 anon.txt
```