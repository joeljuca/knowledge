# gpg 🔒

[GNU Privacy Guard](https://gnupg.org) - GNU's libre implementation of PGP.

## Install

I've been using GPG Suite instead of plain `gpg`, so in macOS it's a matter of:

```sh
brew install gpg-suite
```

## Usage (cheatsheet)

## `gpg --list-keys`

Lists all GPG keys in your keychain.

## `gpg --list-secret-keys --keyid-format LONG`

If you're looking for your own keys, this is probably the command you're looking for. It will list secret keys only, including key IDs in the output.

```
$ gpg --list-secret-keys --key-format LONG
$HOME/.gnupg/pubring.kbx
-----------------------------
sec   rsa4096/AA9F6CB28B67BDA3 2022-02-10 [SC] [expires: 2025-01-01]
      086760D4F317A99E271802B4AA9F6CB28B67BDA3
uid                 [ultimate] Joel Jucá <joelwallis@gmail.com>
ssb   rsa4096/4A11F4331FF35AF9 2022-02-10 [E] [expires: 2025-01-01]
```

The output is read somehow like that:

```
$ gpg --list-secret-keys --key-format LONG
$HOME/.gnupg/pubring.kbx
-----------------------------
sec   @{key-algorithm}/@{key-id} @{creation-date} [SC] [expires: @{expiration-date}]
      @{fingerprint}
uid                 [ultimate] @{user-name} <@{user-email}>
ssb   rsa4096/4A11F4331FF35AF9 2022-02-10 [E] [expires: 2025-01-01]
```

## `gpg --symmetric <filename>`

Encrypts a file with a password, which will be asked from you in the process.

## `gpg --encrypt --sign --recipient <your-email> <filename>`

Encrypts a file with a given GPG key.
