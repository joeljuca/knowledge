# linux 🐧

## Creating boot USB sticks/microcards on macOS

A real quick-and-dirty way.

### 1º. Get an operating system image

You gotta get a `*.img` file somehow. Most distributions distribute them as compacted versions (tar, gzip, xz, etc.).

If all you've got is a `*.iso` file, convert it to `*.img` using `hdiutil`:

```
hdiutil convert -format UDRW -o /output.img /path/to/your/file.iso
```

### 2º. Prepare your removable

Format your removable as FAT32.

### 3º. Now, find the physical address of your removable

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

### 4º. Copy the raw data to your disk

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

> **💡 Use GNU `dd` to get progress reporting**
>
> The `dd` binary that ships in macOS does not report progress, but the GNU's does. You can install it through Homebrew's pkg `coreutils` (`brew install coreutils`).
>
> GNU's `dd` will then be available in your `$PATH` as `gdd`.

With GNU `dd` in place, you can run it just like you would do in `dd`, with an additional option, `status=progress`:

```
gdd bs=1M status=progress if=./your-image.img of=/dev/disk2
```

<!--
> Note: the parameter `bs` of GNU dd seems to work only with a quantity of bytes and does not understand magnitude suffixes (eg: `K` fo kylobyte, `M` for megabyte, etc.), so you must inform a number with no suffixes. It defaults to `512`, but you must inform your own. Since `512` is very small, you can use `1024` for read/write 1KB at a time, `2048` for 2KB, etc. - I've been using `8388608` (8MB) and it works well - though writing to a microsd imposes its own writing speeds.
-->

**Additional resources:**

- [https://developer.ubuntu.com/core/get-started/installation-medias](https://developer.ubuntu.com/core/get-started/installation-medias)
