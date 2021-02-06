# linux 🐧

## HOW TOs

### Creating boot USB sticks/microcards on macOS

A real quick-and-dirty way.

**\#1: Get an operating system image**

You gotta get a `*.img` file somehow. Most distributions distribute them as compacted versions (tar, gzip, xz, etc.).

If all you've got is a `*.iso` file, convert it to `*.img` using `hdiutil`:

```
hdiutil convert -format UDRW -o /output.img /path/to/your/file.iso
```

**\#2: Prepare your removable**

Format your removable as FAT32.

**\#3: Now, find the physical address of your removable**

Plug your removable into your macOS system and run:

```
diskutil list
```

You'll see something like this:

```
/dev/disk0 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *100.0 GB   disk0
   1:                        EFI EFI                      79.0 MB   disk0s1
   2:          Apple_CoreStorage HD                       99.0 GB   disk0s2
   3:                 Apple_Boot Recovery HD             650.0 MB   disk0s3

/dev/disk1 (internal, virtual):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:                  Apple_HFS HD                      +98.0 GB   disk1
                                 Logical Volume on disk0s2
                                 A1B2C3D4-E5F6-G7H8-J9K1-0L11M12N13P1
                                 Unencrypted

/dev/disk2 (external, physical):
  #:                       TYPE NAME                    SIZE       IDENTIFIER
  0:     FDisk_partition_scheme                        *2.0 GB     disk2
  1:                 DOS_FAT_32 SD                      2.0 GB     disk2s1
```

Now figure out which one is the physical address of your removable disk.

TL;DR: `diskutil list` lists all your disks, both physical and virtual. You'll have to figure out which **physical** disk is your removable, but you can generally check it through the storage capacities (in the example, it's a microsd capable of 2GB storage).

**\#4: Copy the raw data to your disk**

After identifying the physical address of your removable, run:

```
diskutil unmountDisk <your removable disk address>
```

According to the example above, it would be:

```
# diskutil unmountDisk /dev/disk2
```

Then use `dd` to copy the contents your ``\*.img` file into your disk:

```
sudo dd if=path/to/your/file.img if=<your-removable-disk> bs=1ms
```

**Additional resources:**

- https://developer.ubuntu.com/core/get-started/installation-medias
