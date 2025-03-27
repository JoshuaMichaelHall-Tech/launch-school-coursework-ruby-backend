##### Purpose

"This Gem lets you configure which Ruby and which Gems each of your projects need." -From the Book
##### Installation

```term
$ gem install bundler
```


##### Gemfile and Gemfile.lock

Bundler relies on gemfile to tell it which Ruby and Gems it should use. Gemfiles use a Domain Specific Language (DSL). 


##### Using Gemfile

```term
$ bundle install
```

This command causes Bundler to install all the dependencies listed in the Gemfile.

##### Sample Gemfile
```term
source 'https://rubygems.org'

ruby '2.3.1'
gem 'sinatra'
gem 'erubis'
gem 'rack'
gem 'rake'
```

##### Using Gemfile.lock
After bundler creates the Gemfile.lock, add to the beginning of the app(before any other `require...`):

```term
require 'bundler/setup'
```

##### Bundle exec

Used to resolve dependency conflicts when in the shell. When you get a `Gem::LoadError` it is often because the command requires a different version of the Gem than that which is loaded. The fix is:

```term
$ bundle exec rake #or whatever app caused the error.
```

##### Missing Gem
When Gem is missing from Gemfile.lock, you will get this error:

```term
in `require': cannot load such file -- colorize (LoadError)
```

The solution is to add the Gem to the Gemfile and then run `bundle install`.

##### Bundler Versions
Using the wrong version can cause problems...

