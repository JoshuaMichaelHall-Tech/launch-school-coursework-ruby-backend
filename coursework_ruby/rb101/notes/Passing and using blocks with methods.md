Make sure you don't mix up **method invocation with a block** and **method definition** when you're working with local variable scope issues. They may look similar at first, but they are not the same. They have different behaviors when it comes to local variable scope.

```ruby
# Method invocation with a block

[1, 2, 3].each do |num|
  puts num
end
```

```ruby
# Method definition

def print_num(num)
  puts num
end
```

#### Scope
Unsurprisingly, the rules of scope for a method invocation with a block remain in full effect even if we're working inside a method definition.

```ruby
def some_method
  a = 1
  5.times do
    puts a
    b = 2
  end

  puts a
  puts b
end

some_method     # => NameError: undefined local variable or method `b' for main:Object
```

Method definitions _cannot_ directly access local variables initialized outside of the method definition, nor can local variables initialized outside of the method definition be reassigned from within it. A block _can_ access local variables initialized outside of the block and can reassign those variables.