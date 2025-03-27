When block parameters (between pipes ||) match a variable in an outer scope, they are said to shadow the outer variable, blocking it.

```Ruby
n = 10

[1, 2, 3].each do |n|
  puts n
end
```

