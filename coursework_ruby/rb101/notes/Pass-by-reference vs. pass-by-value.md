Is Ruby pass-by-reference or pass-by-value? Neither, but rather _pass by value of the reference_ or _call by sharing_.

Looks like pass by reference:

```Ruby
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name           # => Jim
```

Looks like pass by value:
```Ruby
def cap(str)
  str.capitalize
end

name = "jim"
cap(name)
puts name           # => jim
```

Key takeaway: when an operation within the method mutates the caller or argument, it will affect the original object.

