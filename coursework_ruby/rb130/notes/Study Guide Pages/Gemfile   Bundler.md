1. Used by Bundler
2. Needs 4 pieces of info:
	1. Where Bundler can find necessary Rubygems
	2. Whether need .gemspec file
	3. Required version of Ruby
	4. List of necessary Rubygems

#### Sample Gemfile

``` Gemfile
source 'https://rubygems.org'

ruby '3.2.5'

gem 'minitest', '~> 5.10'
gem 'minitest-reporters', '~> 1.1'
```


### Bundler

A dependency manager.

```terminal
gem install bundler
```

Uses Gemfile and Gemfile.lock

Gemfile

```
source 'https://rubygems.org'
ruby '2.3.1'
gem 'sinatra'
gem 'erubis'
gem 'rack'
gem 'rake'
```

`bundle install` scans `Gemfile` , installs all dependencies, and creates `Gemfile.lock`.

```terminal
$ bundle install
```

Gemfile.lock

```Ruby
GEM
  remote: https://RubyGems.org/
  specs:
    erubis (2.7.0)
    rack (1.6.4)
    rack-protection (1.5.3)
      rack
    rake (10.4.2)
    sinatra (1.4.7)
      rack (~> 1.5)
      rack-protection (~> 1.4)
      tilt (>= 1.3, < 3)
    tilt (2.0.5)

PLATFORMS
  ruby

DEPENDENCIES
  erubis
  rack
  rake
  sinatra

RUBY VERSION
   ruby 2.3.1p112

BUNDLED WITH
   1.13.6
```


Add to top of program:

```ruby
require 'bundler/setup'
```

### Bundle Exec
When the wrong version of rake is running, some shell commands will not work without run the command with `bundle exec`:

```terminal
$ bundle exec rake
```

