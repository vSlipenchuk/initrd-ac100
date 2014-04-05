# simple BOOT script called from initrd.boot.img

echo  "Your are in inird.boot ash, type exit to boot"
ls boot
echo  "Mount dir: $1 StartFrom device: $2"

cd /mnt/dev

while true; do

prn0 "boot from SDA1 (sd,usb,live,changes):"
read cmd

if [ "$cmd" = "" ] ; then cmd="changes"; fi

. boot/$cmd && break


done