# fin-disc Tool

fin-disc can be used to finalize a user burned disc.

#### Example:
```shell
[example@localhost ~]$ fin-disc
Unmounting device /dev/sr0 from /mnt/cdrom.
Media in /dev/sr0 will be fixated.
Proceed [y/N]: y
Please reinsert the media to remount the disc.
```

fin-disc detects if a specified disc is currently mounted or not, and then
finalizes the disk to keep it from being written to again.
