# [asdf](https://asdf-vm.com)

asdf might fail to install some project versions with the following error:

> _Authenticity of checksum file can not be assured! Please be sure to check the README of asdf-nodejs in case you did not yet bootstrap trust. If you already did that then that is the point to become SUSPICIOUS! There must be a reason why this is failing. If you are installing an older NodeJS version you might need to import OpenPGP keys of previous release managers. Exiting._

It fails to verify the authenticity of packages' signatures. A simple fix is to import some keys by executing a command provided by asdf itself:

```
~/.asdf/plugins/nodejs/bin/import-release-team-keyring
```
