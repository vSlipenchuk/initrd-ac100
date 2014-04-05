initrd-ac100
============

its a quite simple utility allows pass control while boot ac100
to external file with name "initrd.boot", that normally pass
control to one or other file, placed in directory "boot" nearby.

initrd.sfs starts run after kernel loads as usual initrd, and then
scans for partitions for file "initrd.boot" and call it for exec.
scanning can be controlled by variable TRYDEV in a head of "common" script.


initrd for ac100 for choosing/switching  boot config with simple edit boot file


We need initrd tree and kernel image to pack in one file
this procedure can be done wirh "./d all" (mkbootimg & squashfs-tools required)

after that we have ready to write image (with name can be corrected
in the head of d-script.

