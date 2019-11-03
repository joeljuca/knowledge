# erlang ⓔ

My adventures on this amazing distributed computing platform.

## Erlang on macOS through asdf

Installing Erlang through asdf is probably the easiest way to get it up and running on macOS. You'll need OpenSSL to run the installation, and the easiest way to get it is through Homebrew:

```
brew install openssl
```

Homebrew's OpenSSL formula is keg-only, and it means that even after installed it won't be globally available in your system. [There's an useful note about it on asdf-erlang's README.md](https://github.com/asdf-vm/asdf-erlang#dealing-with-openssl-issues-on-macos), but I ended up with a command that would use `brew` to get the path of the OpenSSL installation:

```sh
# first, export this Kerl-specific variable with the following content
export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl@1.1)"

# then, install the Erlang version you want (e.g.: 22.1.5)
asdf install erlang 22.1.5
```

These options will disable Java-related features and point to the correct OpenSSL paths.