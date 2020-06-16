# ruby 💎

Ruby is awesome!

## Command-line Twitter with t

Ruby has a powerful library called [t (https://rubygems.org/gems/t)](https://rubygems.org/gems/t). Unfortunatelly, it seems abandoned by its author, and currently presents a dependency issue, requiring you to install the version 6.1.0 [_twitter_](https://rubygems.org/gems/twitter) library, instead of 6.2.0:

```sh
gem install t
gem install twitter -v 6.1.0
gem uninstall twitter -v 6.2.0
```
