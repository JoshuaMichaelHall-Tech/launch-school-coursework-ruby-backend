MY_CONSTANT = "I am available throughout your app"

- Cannot be declared in method definitions.
- Override all scope boundaries.
- Used rarely due to unexpected consequences.


```Ruby
MY_CONSTANT = "I am available throughout your app"

def print_out_scope
  puts MY_CONSTANT
end

print_out_scope #prints "I am available throughout your app" to STDOUT
```