
Mount dir:
 dev - root device, mounted by initrd (after search for initrd.boot)
 sys - targeted system, must be tuned up by script initrd.boot
 modules - kernel modules, mailny  `uname -r`.sfs
 changes - either tmpfs or real system on top of aufs mount - used in live systems
 0...9   - used in boot while attach sfs-modules in initrd.boot
 00..99  - used in real-time (by "sfs add <module>") and by /cfg/sfs script...


