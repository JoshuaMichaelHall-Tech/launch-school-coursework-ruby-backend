
### How Blocks Work
We can call methods with blocks. For example, we use a block when calling #each. We can save blocks to a variable, pass them around from method to method, and pass them explicitly or implicitly to a method.

### When to Use Blocks
1. When we want to enable the person calling the method to add custom functionality.
2. When we want to perform before and after actions (sandwich code).
	1. time a process
	2. open/close

#### Examples

```ruby
# Passing a block to a method
[1, 2, 3].each { |int| p int }

# Using sandwich code to time a process
def how_long
  start_time = Time.now
  yield
  end_time = Time.now

  puts "Time to complete was #{end_time - start_time} seconds!"
end

how_long { sleep(1) }

# Using sandwich code to open and close a file
custom_file = File.open("my_file.txt", "w+") do |file|
  # do something
end # #open automatically closes the file after the block is finished running.
```



## From Book
All methods can take a block. But only some actually use it. In order for a method to use a block, it has to be defined in such a way as to use it. One way is through the `yield` keyword. `yield` executes the block.

```ruby
def echo_with_yield(str)
  yield
  str
end

echo_with_yield("hello!") { puts "world" }     # world
	# => "hello!"

```


When we want to define a method which allows the implementation to define some of its behavior, we can use a block.

If we use the `yield` keyword but then do not pass a block with the method call, we get an error:

```ruby
echo_with_yield("hello!") # LocalJumpError: no block given (yield)
```

We can use the  the `Kernel#block_given?` method to make the block optional:

```ruby
def echo_with_yield(str)
  yield if block_given?
  str
end
```

Here is an example of granting the ability to do something with a method return to the caller by yielding and passing the return to the block:

```ruby
# method implementation
def increment(number)
  if block_given?
    yield(number + 1)
  end
  number + 1
end

# method invocation
increment(5) do |num|
  puts num
end
```

The rule regarding the number of arguments that you must pass to a block, `proc`, or `lambda` in Ruby is called its **arity**. In Ruby, blocks and `proc`s have **lenient arity**, which is why Ruby doesn't complain when you pass in too many or too few arguments to a block. `Methods` and `lambda`s, on the other hand, have **strict arity**, which means you must pass the exact number of arguments that the `method` or `lambda` expects.

When to use blocks:

1. Defer some implementation code to method invocation decision.
2. Methods that need to perform some "before" and "after" actions - sandwich code.

Sandwich Code:

```ruby
def time_it
  time_before = Time.now
  yield                       # execute the implicit block
  time_after= Time.now

  puts "It took #{time_after - time_before} seconds."
end

time_it { sleep(3) }              # It took 3.003767 seconds.
                                  # => nil

time_it { "hello world" }         # It took 3.0e-06 seconds.
                                  # => nil
```

Common uses for sandwich code include timing a process, closing a file after it has ben opened and used, or allocating and later releasing system resources after a process has been run.

Defining an explicit block allows us to name it. To define an explicit block, you simply add a parameter to the method definition where the name begins with an `&` character:

```ruby
def test(&block)
  puts "What's &block? #{block}"
end

test { sleep(1) }

# What's &block? #<Proc:0x007f98e32b83c8@(irb):59>
# => nil
```

The `&block` is a special parameter that converts the block argument to what we call a "simple" `Proc` object. Notice that we drop the `&` when referring to the parameter inside the method.

Once a `Proc` object has been created, it can be passed into a method and called using block.call:

```ruby
def test2(block)
  puts "hello"
  block.call          # calls the block that was originally passed to test()
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

test { |prefix| puts "xyz" }
# => 1
# hello
# xyz
# good-bye
# => 2
```

