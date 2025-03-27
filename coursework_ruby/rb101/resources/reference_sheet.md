# RB101: Programming Foundations with Ruby: Basics (Extended) - Reference Sheet

## Method Definition and Invocation

```ruby
# Method definition
def say(words = 'Hello')  # Default parameter
  puts words + '.'
end

# Method invocation
say()      # prints: Hello.
say('hi')  # prints: hi.
```

## Pass by Reference vs. Value

```ruby
# Reassignment vs. Mutation
def append(s)
  s << ' world'  # Mutates the caller
end

def reassign(s)
  s = s + ' world'  # Reassignment, local only
end

str = 'hello'
append(str)
puts str  # => "hello world"

str = 'hello'
reassign(str)
puts str  # => "hello" (unchanged)
```

## Variable Scope

```ruby
# Method scope
a = 1        # Outer scope variable

def method
  a = 2      # Method scope variable, not visible outside
  puts a
end

method       # prints: 2
puts a       # prints: 1

# Block scope
[1, 2, 3].each do |n|
  puts a     # Can access outer scope variable
  b = 2      # Block scope variable
end

puts b       # Error: undefined local variable
```

## Variable Shadowing

```ruby
a = 5

3.times do |a|  # Block parameter 'a' shadows outer variable 'a'
  puts a        # Refers to the block parameter, not the outer variable
end             # prints: 0, 1, 2

3.times do |b|
  puts a        # No shadowing, refers to outer variable 'a'
end             # prints: 5, 5, 5
```

## Object IDs and Variables as Pointers

```ruby
a = "hello"
b = a        # b now points to the same object as a
puts a.object_id == b.object_id  # => true

a = "hi"     # Reassignment, a now points to a different object
puts a.object_id == b.object_id  # => false
puts b       # => "hello" (unchanged)

c = a
a << " there"  # Mutation affects all variables pointing to this object
puts a       # => "hi there"
puts c       # => "hi there"
```

## Truthiness and Conditionals

```ruby
# Only false and nil are falsy in Ruby
if nil
  puts "This won't print"
elsif false
  puts "This won't print either"
else
  puts "This will print"
end

# Everything else is truthy
if 0         # zero is truthy in Ruby (unlike some languages)
  puts "This will print"
end

if ""        # empty string is truthy
  puts "This will print too"
end

if [1, 2]    # arrays (even empty ones) are truthy
  puts "This will also print"
end
```

## Block Examples

```ruby
# Passing a block to a method
[1, 2, 3].each do |num|
  puts num * 2
end

# Defining a method that yields to a block
def greet
  puts "Before yield"
  yield if block_given?
  puts "After yield"
end

greet { puts "Hello from the block!" }

# Passing values to a block
def with_value
  yield(42) if block_given?
end

with_value { |value| puts "The value is #{value}" }
```

## Constants

```ruby
MY_CONSTANT = "I am available throughout your app"

def print_out_scope
  puts MY_CONSTANT  # Constants are accessible in methods
end

print_out_scope     # prints: I am available throughout your app
```
