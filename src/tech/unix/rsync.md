# rsync 🔁

> _"rsync is an open source utility that provides fast incremental file transfer. rsync is freely available under the GNU General Public License and is currently being maintained by Wayne Davison. "_
>
> rsync website. [rsync.samba.org](https://rsync.samba.org)

So, rsync. This is definitely one of my favorite piece of software in the world! It basically is a swiss-knife tool for anything related to syncing files across folders.

## Using rsync

Using rsync is super simple! Here's the command synopsis taken from its manual (`man rsync`):

```
NAME
       rsync - a fast, versatile, remote (and local) file-copying tool

SYNOPSIS
       Local:
           rsync [OPTION...] SRC... [DEST]

       Access via remote shell:
           Pull:
               rsync [OPTION...] [USER@]HOST:SRC... [DEST]
           Push:
               rsync [OPTION...] SRC... [USER@]HOST:DEST

       Access via rsync daemon:
           Pull:
               rsync [OPTION...] [USER@]HOST::SRC... [DEST]
               rsync [OPTION...] rsync://[USER@]HOST[:PORT]/SRC... [DEST]
           Push:
               rsync [OPTION...] SRC... [USER@]HOST::DEST
               rsync [OPTION...] SRC... rsync://[USER@]HOST[:PORT]/DEST)

       Usages with just one SRC arg and no DEST arg will list the source files
       instead of copying.
```

You'll find a long list of options by reading its manual - but I'll list here the post important ones:

- `-c`: compare files' checksums during sync
- `-r`: sync files and dirs recursively
- `-l`: copy symlinks as symlinks
- `-n`: dry run (run a trial; aka. without changes)
- `-z`: compress files during transfer (useful when syncing through network)
- `--progress`: show progress during transfer

So, a quick-and-dirty example to sync two folders would be like that:

```sh
# Assuming there's pen drive named "pen0" mounted in `/Volumes/pen0`, here's
# how you could sync files between a folder with the same name in your $HOME

# First, there must be a folder to be used as destiny (it's important)
mkdir /Volumes/pen0/my-files

rsync -cr --progress $HOME/my-files/ /Volumes/pen0/my-files/

# PS: the forward slashes in the end of every directory name are importants too
```

## rsync in the real world

I used rsync to automate the deployment of WordPress-based projects in the past, back in my old days of PHP/WordPress. The techniques used were shown in a presentation held during a meetup of PHP-PB in April 2017. The ideas in this setup are still useful today:

[https://speakerdeck.com/joeljuca/wordpress-at-meetup-php-pb](https://speakerdeck.com/joeljuca/wordpress-at-meetup-php-pb)
