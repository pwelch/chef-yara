## Description

Chef cookbook to install and configure [YARA](http://plusvic.github.io/yara/), the pattern matching swiss knife for malware researchers.

## Usage

Include `yara::default` recipe in the `run_list`.

To disable installing yara-python set the following attribute:
```
  default[:yara][:install_yara_python] = false
```

## Testing

```
  bundle install

  # Run Unit and Lint Tests
  bundle exec rake

  # Run Test-Kitchen Integration Tests
  kitchen test
```

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Source code available [here](https://github.com/pwelch/chef-yara)
