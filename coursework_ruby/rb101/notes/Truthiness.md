Only false and nil are falsy. Everything else is truthy.

```ruby
name = find_name

if name && name.valid?
  puts "great name!"
else
  puts "either couldn't find name or it's invalid"
end
```

The `if` conditional above is checking that `name` is not `nil`, then checking the validity of `name`. It's doing this by relying on the `&&` short circuit behavior to not execute `name.valid?` if `name` is `nil`. Remember that `&&` short circuits if it encounters a `false`, and `nil` is considered "falsy".