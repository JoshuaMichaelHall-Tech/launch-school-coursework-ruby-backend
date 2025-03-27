
#### Custom Methods Using a Block

```ruby
def my_method # using yield
  yield
end

my_method { puts "Hello, World!"} # => "Hello, World!"

def other_method(arg) # using yield
  yield
  puts arg
end

other_method('World!') { print "Hello, "} # => "Hello, World!"

# To prevent LocalJumpError (no block given to call yield on)
def no_jump(arg) # using yield
  yield if block_given?
  puts arg
end

no_jump('World!') { print "Hello, "} # => "Hello, World!"
no_jump('World!') # => "World!"

# yield with an argument

def yield_w_arg(int)
  if block_given?
    yield(int + 1)
  end
  int + 1  
end

yield_w_arg(9) do |num|
  puts num
end # => 10

# sandwich

def before_after(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

before_after("test") { |word| word.capitalize }
	# => "Before: test"
	# => "After: Test"
```


#### Custom Methods Using a Proc

```ruby
def my_method
  yield(2)
end

my_method(&:to_s) # => '2'


def some_method(a_proc)
  [1, 2, 3].each { |n| a_proc.call(n) }
end

proc = Proc.new { |n| puts n }
some_method(proc) #=> 1; 2; 3
```