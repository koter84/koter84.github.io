#!/bin/bash

BASE_DIR="/mnt/usb/tftpfedora"
YUM_TMP_DIR="/tmp/fedora"

## ----- ----- ----- ----- ----- ##

# Clean-Up?
ssh kwak rm -r $BASE_DIR

sudo yum install syslinux shim grub2-efi --installroot=$YUM_TMP_DIR --releasever 21

ssh kwak mkdir -p $BASE_DIR
scp $YUM_TMP_DIR/usr/share/syslinux/{pxelinux.0,vesamenu.c32,ldlinux.c32,libcom32.c32,libutil.c32} kwak:$BASE_DIR

ssh kwak mkdir -p $BASE_DIR/pxelinux.cfg
scp pxe_default kwak:$BASE_DIR/pxelinux.cfg/default
scp pxe_efidefault kwak:$BASE_DIR/pxelinux.cfg/efidefault

ssh kwak mkdir -p $BASE_DIR/uefi
scp $YUM_TMP_DIR/boot/efi/EFI/fedora/{shim.efi,grubx64.efi} kwak:$BASE_DIR/uefi/

ssh kwak mkdir -p $BASE_DIR/f21_32
ssh kwak wget http://download.fedoraproject.org/pub/fedora/linux/releases/21/Server/i386/os/images/pxeboot/vmlinuz -O $BASE_DIR/f21_32/vmlinuz
ssh kwak wget http://download.fedoraproject.org/pub/fedora/linux/releases/21/Server/i386/os/images/pxeboot/initrd.img -O $BASE_DIR/f21_32/initrd.img
#ssh kwak wget http://download.fedoraproject.org/pub/fedora/linux/releases/21/Server/i386/os/images/pxeboot/vmlinuz-PAE -O $BASE_DIR/f21_32/vmlinuz-PAE
#ssh kwak wget http://download.fedoraproject.org/pub/fedora/linux/releases/21/Server/i386/os/images/pxeboot/initrd-PAE.img -O $BASE_DIR/f21_32/initrd-PAE.img

ssh kwak mkdir -p $BASE_DIR/f21_64
ssh kwak wget http://download.fedoraproject.org/pub/fedora/linux/releases/21/Server/x86_64/os/images/pxeboot/vmlinuz -O $BASE_DIR/f21_64/vmlinuz
ssh kwak wget http://download.fedoraproject.org/pub/fedora/linux/releases/21/Server/x86_64/os/images/pxeboot/initrd.img -O $BASE_DIR/f21_64/initrd.img

