#set it if do not need device scan
mntdev=sda1

n=boot-v6-$mntdev.img

#kernel to use for packing initrd with
k=3.0.8-vs6-linux.img-zImage



C="nowait mntdev=$mntdev root=/dev/ram0 init=/linuxrc  mem=448M@0M nvmem=64M@448M vmalloc=320M video=tegrafb \
console=tty0  tegrapart=recovery:300:a00:800,boot:d00:1000:800,mbr:1d00:200:800,system:1f00:25800:800,cache:27700:32000:800,misc:59700:400:800,userdata:59c00:9a600:800"

case "$1" in
  all)
    rm initramfs.cpio initramfs.cpio.gz initrd.sfs  $n
    unsquashfs -f -d initrd devmnt.sfs
    #cd initrd
    # find . | cpio -H newc -o > ../initramfs.cpio
    #cd ..
    #gzip initramfs.cpio
    #mkbootimg --kernel 3.0.8-vs*zImage --ramdisk initramfs.cpio.gz --cmdline "$C" -o $n
    
    mksquashfs initrd initrd.sfs 
    echo "Compose $n bootimg, with kernel $k and CMD:$C"
    mkbootimg --kernel $k --ramdisk initrd.sfs --cmdline "$C" -o $n
    
    #gzip mksquashfs initrd initrd.sfs
    #mkbootimg --kernel 3.0.8-vs4*zImage --ramdisk initrd.ext2.gz --cmdline "$C" -o $n
    
    #mount -t tmpfs none /mnt/tmp
    
    
    
    ;;
  boot)
    dd if=$n of=/dev/mmcblk0p2 && reboot
    ;;
 sos)
    dd if=$n of=/dev/mmcblk0p1 && reboot
    ;;
    
  All)
    $0 all && $0 boot
    ;;
  *)
  echo "usage all|boot|All"
    ;;
esac