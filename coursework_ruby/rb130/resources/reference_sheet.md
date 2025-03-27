# RB130: Ruby Foundations: More Topics - Reference Sheet

## Blocks and Procs

### Using yield

```ruby
# Basic yield to a block
def my_method
  puts "Before yield"
  yield if block_given?
  puts "After yield"
end

my_method { puts "Inside block!" }
# => Before yield
# => Inside block!
# => After yield

# Yield with arguments
def my_method_with_args
  yield(1, 2) if block_given?
end

my_method_with_args { |x, y| puts x + y }  # => 3

# Return value from a block
def calculate
  result = yield if block_given?
  "The result is #{result}"
end

calculate { 2 + 2 }  # => "The result is 4"
```

### Explicit Blocks

```ruby
# Converting a block to a Proc parameter
def my_method(&block)
  puts "Block class: #{block.class}"
  block.call if block
end

my_method { puts "Hello" }
# => Block class: Proc
# => Hello

# Passing the block to another method
def wrapper(&block)
  puts "Before passing block"
  my_other_method(&block)
  puts "After passing block"
end

def my_other_method(&block)
  puts "Inside other method"
  block.call
end

wrapper { puts "Inside block!" }
# => Before passing block
# => Inside other method
# => Inside block!
# => After passing block
```

### Procs and Lambdas

```ruby
# Creating a Proc
my_proc = Proc.new { |x| puts x }
my_proc.call(42)  # => 42

# Alternative creation syntax
my_proc = proc { |x| puts x }
my_proc.call(42)  # => 42

# Creating a lambda
my_lambda = lambda { |x| puts x }
my_lambda.call(42)  # => 42

# Alternative lambda syntax (stabby lambda)
my_lambda = ->(x) { puts x }
my_lambda.call(42)  # => 42

# Arity differences
proc_flex = Proc.new { |x, y| puts "#{x} and #{y}" }
proc_flex.call(1)  # => "1 and " (lenient arity)

lambda_strict = lambda { |x, y| puts "#{x} and #{y}" }
# lambda_strict.call(1)  # => ArgumentError: wrong number of arguments (strict arity)

# Return behavior differences
def proc_return
  my_proc = Proc.new { return "Returning from proc!" }
  my_proc.call
  "This will not be reached"
end

def lambda_return
  my_lambda = lambda { return "Returning from lambda!" }
  my_lambda.call
  "This will be reached"
end

proc_return    # => "Returning from proc!"
lambda_return  # => "This will be reached"
```

## Testing with Minitest

```ruby
# Basic test setup
require 'minitest/autorun'

class MyTest < Minitest::Test
  def test_addition
    assert_equal 4, 2 + 2
  end
end

# Setup and teardown
class ComplexTest < Minitest::Test
  def setup
    @value = 1
    @array = [1, 2, 3]
  end
  
  def test_value
    assert_equal 1, @value
  end
  
  def test_array
    assert_includes @array, 2
  end
  
  def teardown
    # Clean up resources if needed
  end
end
```

### Common Assertions

```ruby
# Basic assertions
assert(test)                  # Passes if test is truthy
assert_equal(exp, act)        # Passes if exp == act
assert_nil(obj)               # Passes if obj is nil
assert_raises(ErrorClass) { } # Passes if block raises specified error
assert_instance_of(cls, obj)  # Passes if obj is instance of cls
assert_includes(coll, obj)    # Passes if collection includes obj
assert_empty(obj)             # Passes if obj is empty
assert_same(exp, act)         # Passes if exp.equal?(act) (same object)

# Negative assertions (refutations)
refute(test)                  # Passes if test is falsy
refute_equal(exp, act)        # Passes if exp != act
refute_nil(obj)               # Passes if obj is not nil
refute_includes(coll, obj)    # Passes if collection doesn't include obj
```

## Bundler and Gemfile

```ruby
# Sample Gemfile
source 'https://rubygems.org'

ruby '2.7.2'
gem 'minitest', '~> 5.10'
gem 'minitest-reporters', '~> 1.1'
gem 'rake', '~> 13.0'

group :development do
  gem 'rubocop', '~> 1.12'
end

group :test do
  gem 'simplecov', '~> 0.21'
end
```

```bash
# Terminal commands
gem install bundler              # Install Bundler
bundle install                   # Install all dependencies
bundle update                    # Update all gems to latest versions
bundle exec rake                 # Run rake through Bundler
bundle exec ruby my_script.rb    # Run script with Bundler environment
```

## Rake Tasks

```ruby
# Basic Rakefile
require 'rake/testtask'

desc 'Run tests'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

desc 'Say hello'
task :hello do
  puts "Hello there. This is the `hello` task."
end

desc 'Say goodbye'
task :bye do
  puts 'Bye now!'
end

desc 'Do everything'
task :default => [:hello, :bye, :test]
```

```bash
# Terminal commands for Rake
rake           # Run the default task
rake hello     # Run the hello task
rake -T        # List all available tasks with descriptions
```

## Custom Iterators

```ruby
# Building your own each method
class Array
  def my_each
    for i in 0...size
      yield(self[i])  # Yield each element to the block
    end
    self  # Return the original array
  end
end

[1, 2, 3].my_each { |num| puts num }

# Building your own map method
class Array
  def my_map
    result = []
    each do |element|
      result << yield(element)  # Store result of block for each element
    end
    result  # Return the new array
  end
end

[1, 2, 3].my_map { |num| num * 2 }  # => [2, 4, 6]

# Building your own select method
class Array
  def my_select
    result = []
    each do |element|
      result << element if yield(element)  # Include element if block returns true
    end
    result
  end
end

[1, 2, 3, 4].my_select { |num| num.even? }  # => [2, 4]
```

## Symbol to Proc

```ruby
# Using the shorthand syntax for common operations
numbers = [1, 2, 3, 4, 5]

# Instead of
numbers.map { |n| n.to_s }  

# You can use
numbers.map(&:to_s)  # => ["1", "2", "3", "4", "5"]

# Instead of
numbers.select { |n| n.even? }

# You can use
numbers.select(&:even?)  # => [2, 4]

# How it works internally (simplified)
def convert_symbol_to_proc(symbol)
  Proc.new { |obj| obj.send(symbol) }
end

# So &:to_s is roughly equivalent to:
numbers.map(&convert_symbol_to_proc(:to_s))
```
