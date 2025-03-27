No method can mutate an immutable argument.
Most methods do not mutate, some mutate the caller, few mutate the argument.
Assignment is non-mutating. = acts like non-mutating method.

```Ruby
def fix(value)  
  value.upcase!  
  value.concat('!')  
  value  
end

s = 'hello'  
t = fix(s)
```
When this code runs, what values do `s` and `t` have?

We start by passing `s` to `fix`; this binds the String represented by `'hello'` to `value`. In addition, `s` and `value` are now aliases for the String.

Next, we call `#upcase!` which converts the String to uppercase. A new String is not created; the String that is referenced by both `s` and `value` now contains the value `'HELLO'`.

We then call `#concat` on `value`, which also mutates `value` instead of creating a new String; the String now has a value of `"HELLO!"`, and both `s` and `value` reference that object.

Finally, we return a reference to the String and store it in `t`.

The only place we create a new String in this code is when we assign `'hello'` to `s`. The rest of the time, we operate directly on the object, mutating it as needed. Thus, both `s` and `t` reference the same `String`, and that `String` has the value `'HELLO!'`.