All methods take an optional block, but not all of them do something with that block.

Methods which are written to take a block may take one implicitly or explicitly. Methods which take an implicit block use the `yield` keyword to call the block:

```ruby
def my_method
  yield if block_given?
end

my_method { puts "Block was given!" }
```

Methods which take an explicit block use `.call` to call the block:

```ruby
def my_method(&block)
  block.call
end

my_method { puts "Block was given!" }
```

