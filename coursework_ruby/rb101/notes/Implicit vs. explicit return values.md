Methods return last evaluation by definition, so this return is implicit. Explicit return is when a return call is made in the definition.

Implicit
``` Ruby
def add(a, b)
  a + b
end
# implicit return of evaluation of a + b.
```


Explicit
``` Ruby
def add(a, b)
  return a + b
end
# explicit return of evaluation of a + b.
```
