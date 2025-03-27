Blocks can access variables initialized outside the block, but not vice versa. This does not apply to false blocks: for, while, and until, as these are part of Ruby language and not method invocations.

Nested blocks create nested scopes. Peer blocks cannot reference variables in other blocks.

```Ruby
2.times do
  a = 'hi'
  puts a      # 'hi' <= this will be printed out twice due to the loop
end

loop do
  puts a      # => NameError: undefined local variable or method `a' for main:Object
  break
end

puts a        # => NameError: undefined local variable or method `a' for main:Object
```

Nested blocks follow the same rules of inner and outer scoped variables. When dealing with nested blocks, our usage of what's "outer" or "inner" is going to be relative. We'll switch vocabulary and say "first level", "second level", etc.