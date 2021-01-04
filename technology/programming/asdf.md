# [asdf](https://asdf-vm.com)

asdf might fail to install some project versions with the following error:

> _Authenticity of checksum file can not be assured! Please be sure to check the README of asdf-nodejs in case you did not yet bootstrap trust. If you already did that then that is the point to become SUSPICIOUS! There must be a reason why this is failing. If you are installing an older NodeJS version you might need to import OpenPGP keys of previous release managers. Exiting._

It fails to verify the authenticity of packages' signatures. A simple fix is to import some keys by executing a command provided by asdf itself:

```
~/.asdf/plugins/nodejs/bin/import-release-team-keyring
```

## _"Recent versions not showing up. WTF?"_

The asdf work alongside plugins that declares installers and manages them separatedly. So, in order to see the latest version of the respective binaries (`node`, `ruby`, etc.) you must update their respective plugins.

I ran on this problem today: I was trying to install Ruby 3.0.0 but it wasn't showing up as option when I ran `asdf list all ruby`. The solution? Update the respective plugin:

```sh
asdf plugin update ruby
```

You can also update them all for greater good:

```sh
asdf plugin update -all
```
