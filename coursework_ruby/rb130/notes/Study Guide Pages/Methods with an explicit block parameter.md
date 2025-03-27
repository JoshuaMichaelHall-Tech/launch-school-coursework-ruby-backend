### Definition
Methods can accept a block as an explicit parameter. By prepending a parameter with `&` we tell Ruby to tie that variable to the block passed in. Later in the method definition we call the variable without the prepended `&`.

### Example
```ruby
def my_method(&block)
  puts "This is my block: #{block}"
end 
```

We can return this block, pass it on to another method, or save it.

We call the block by appending `.call` either from within the definition, or by calling it on the method.


### From the Book

An explicit block is a block that gets treated as a named object -- that is, it gets assigned to a method parameter so that it can be managed like any other object -- it can be reassigned, passed to other methods, and invoked many times.
##### Examples

```ruby
def test(&block)
  puts "What's &block? #{block}"
end

test { sleep(1) }

# What's &block? #<Proc:0x007f98e32b83c8@(irb):59>
# => nil
```

1. The `&block` is a special parameter that converts the block argument to what we call a "simple" `Proc` object. 
2. We drop the `&` when referring to the parameter inside the method.
3. We can _pass the block to another method_:

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

Note that you only need to use `&` for the `block` parameter in `#test`. Since `block` is already a `Proc` object when we call `test2`, no conversion is needed.
You can also pass arguments to the explicit block by using them as arguments to `call`:


```ruby
def display(block)
  block.call(">>>") # Passing the prefix argument to the block
end

def test(&block)
  puts "1"
  display(block)
  puts "2"
end

test { |prefix| puts prefix + "xyz" }
# => 1
# >>>xyz
# => 2
```