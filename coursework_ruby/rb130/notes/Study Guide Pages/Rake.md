##### Purpose
Automation Gem used to build, test, package, and install programs.

##### How To
Rake uses a file named `Rakefile` that lives in your project directory.

For instance, here is a very simple `Rakefile`:

```ruby
desc 'Say hello'
task :hello do
  puts "Hello there. This is the `hello` task."
end

desc 'Say goodbye'
task :bye do
  puts 'Bye now!'
end

desc 'Do everything'
task :default => [:hello, :bye]
```

Rubygems layout: : we've put our main source code in the `lib` directory, our tests in the `test` directory, and we've set up a `Gemfile` and a `Rakefile`.

Steps:
- Prepare any additional directories that you need.
- Prepare a `README.md` file.
- Write documentation if necessary.
- Prepare your `.gemspec` file. Note that the actual `.gemspec` file has a name like `project.gemspec`, where "project" is your project name. See below for an example `.gemspec`.
- Add a `gemspec` statement to your `Gemfile`.
- Modify your `Rakefile` to include the standard Rubygem tasks.

The following shows a simple `.gemspec` file for our Todo List Manager project:
todolist_project.gemspec

```ruby
Gem::Specification.new do |s|
  s.name        = 'todolist_project'
  s.version     = '1.0.0'
  s.summary     = 'Todo List Manager!'
  s.description = 'This is a simple todo list manager!'
  s.authors     = ['Pete Williams']
  s.email       = 'pw@example.com'
  s.homepage    = 'http://example.com/todolist_project'
  s.files       = ['lib/todolist_project.rb', 'test/todolist_project_test.rb']
end
```

The name of this file is `todolist_project.gemspec`.

### Modify Your Rakefile

Add the following statement near the top of your `Rakefile`:

```ruby
require "bundler/gem_tasks"
```

The `bundler/gem_tasks` require file adds several tasks to your Rakefile that are common to Rubygems. Specifically, it defines these tasks (don't forget to use `bundle exec`):

- `rake build`: Constructs a `.gem` file in the `pkg` directory. This file contains the actual Rubygem that you will distribute.
- `rake install`: runs `rake build` then installs the program in your Ruby's Gem directory. This way, you can test the Gem without having to load information from your project directory.
- `rake release`: Send your `.gem` file to the remote Rubygems library for the world to download.

`bundler/gem_tasks` provides several additional tasks, but `build`, `install`, and `release` are the most important.