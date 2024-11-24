# freebsd 😈

I'm giving FreeBSD a real try during this pandemic thing. I'm excited by the fact FreeBSD is extremely secure and stable, thus being a great option for servers. Also, there's a jails thing - something like containers, that seems to be even powerful than LXC/Docker and I would like to explore its potential as a disposable desktop environment.

## First experience: FreeBSD on GCP

I need some practical experience to learn things, so I launched a FreeBSD node (a shiny f1-micro one) on Google Cloud. Since it has a Always-Free Tier and I currently don't have things running on GCP, it will cost me nothing (yay!). I'll use it both to learn FreeBSD itself and to deploy some service to play with. I've been looking for an opportunity to deploy a Mastodon instance somewhere, just to play with - and it seemed like a great opportunity!

Creating the machine required me to find a FreeBSD option on GPC's Marketplace. Luckily, it's kind of an official one, made by the FreeBSD Release Engineering team. I'm glad there's an official/supported option available, I wouldn't consider building an image myself.

The next step now is to SSH into it. GCP provides a way to launch a browser window with a shell on it. I used this one to send my public key to `~/.ssh/authorized_keys`, but even still I can't SSH into it. No luck with it.

The solution ended up using the [Google Cloud SDK's](https://cloud.google.com/sdk) command-line `gcloud` (available in Homebrew as a cask), which you can install with the following command (macOS-specific):

```sh
brew cask install google-cloud-sdk
```

Then, you would run the following command to connect to the GCP machine:

```sh
gcloud compute ssh "<your-username>@<your-machine-name>" --project="<your-project>"
```

```
FreeBSD 12.1-RELEASE-p3 GENERIC

Welcome to FreeBSD!

Release Notes, Errata: https://www.FreeBSD.org/releases/
Security Advisories:   https://www.FreeBSD.org/security/
FreeBSD Handbook:      https://www.FreeBSD.org/handbook/
FreeBSD FAQ:           https://www.FreeBSD.org/faq/
Questions List: https://lists.FreeBSD.org/mailman/listinfo/freebsd-questions/
FreeBSD Forums:        https://forums.FreeBSD.org/

Documents installed with the system are in the /usr/local/share/doc/freebsd/
directory, or can be installed later with:  pkg install en-freebsd-doc
For other languages, replace "en" with a language code like de or fr.

Show the version of FreeBSD installed:  freebsd-version ; uname -a
Please include that output and any error messages when posting questions.
Introduction to manual pages:  man man
FreeBSD directory layout:      man hier

Edit /etc/motd to change this login announcement.
ZFS can display I/O statistics for a given pool using the iostat subcommand.
By default, it will display one line of current activity.  To display stats
every 5 seconds run the following command (cancel with CTRL+C):

zpool iostat 5

To view individual disk activities, specify the -v parameter:

zpool iostat -v

Of course, both can be combined. For more options, see zpool(8).
                -- Benedict Reuschling <bcr@FreeBSD.org>
```

It seems that after this _"Edit /etc/motd (...)"_ line the content is dynamic, and shows interesting tips about FreeBSD every time you log in. Cool.

## Package management with `pkg`

The package management solution of FreeBSD is Ports - or [FreeBSD Ports](https://en.wikipedia.org/wiki/FreeBSD_Ports) to be exact. The name seems weird - but yeah, if it works fine I won't care about a weirdo name. Its main command-line interface is the command `pkg`, which seems quite similar to Debian's APT (`apt`):

```sh
# Search for packages with `pkg search`
pkg search htop

# Install a package with `pkg install`
pkg install htop

# See a list of commands with `pkg help`
pkg help
```

I thought it would be harder to learn Ports, but since it looks so similar to Debian I felt at home.

# Service management

FreeBSD uses rc to manage services. Again, it's seems to be similar do Debian's, so nothing that much new here. To manage a service you use the `service` command, followed by the service name (eg: `sshd`), and finally a subcommand (eg: `start`, `stop`, `restart`, etc.):

```sh
# Start sshd
services sshd start

# Stop sshd
services sshd stop

# Restart sshd
services sshd restart
```

It would make more sense if you had something like `service <subcommand> <service-name>` - but again, if it works I can live with it.

## ZFS over FreeBSD

Yep, I dove into ZFS, I gotta learn this thing. So, here's what I've been learning so far:

### ZFS concepts

- **zpool**  
   The most basic ZFS building block. A zpool is a group (one or more) of disk behaving as a single storage "thing". You'll need to create datasets and/or volumes (each described below) in your zpool in order to store files and/or raw data
- **dataset**  
  The ZFS file system. It allows you to store directories and files in hierarchical order, just like any other file system.
- **volume**  
  It's a raw storage unit, useful to store raw data, like non-ZFS file systems like UFS, ext4 (Linux), or NTFS (Windows). IMHO, the great thing here is that it's possible to use non-featureful file systems from within ZFS and have some of its features (compression, snapshots, encryption, etc.) on it
- **vdev**  
  I didn't get this yet
- **snapshot**  
  A point-in-time freezing state of how this dataset or volume looked like at the moment the snapshot was taken. Absolutely useful for backups!

[FreeBSD Fridays: Introduction to ZFS](https://youtu.be/pN7OLChclH8) by Dan Langille

## The FreeBSD Handbook

I'm learning all this stuff by reading the [FreeBSD Handbook](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/), the official project documentation. In fact, I'm learning a ton of interesting stuff about UNIX systems - like permission tricks like [setuid and setgid](https://en.wikipedia.org/wiki/Setuid), [sticky bits](https://en.wikipedia.org/wiki/Sticky_bit)

I highly recommend reading the FreeBSD Handbook if you're interested on learning more about UNIX and/or BSD! The FreeBSD documentation is really awesome and worth reading.
