Output is what an expression does, like print to STDOUT.

Return is the expression's hidden evaluation, the object passed to the caller.

For example: puts outputs the argument to the screen, but returns nil to the caller.

```Ruby
puts "This is a test"
# => This is a test
a = puts "This is a test"
# => This is a test
puts a
# => prints nothing because it returns nil
```
