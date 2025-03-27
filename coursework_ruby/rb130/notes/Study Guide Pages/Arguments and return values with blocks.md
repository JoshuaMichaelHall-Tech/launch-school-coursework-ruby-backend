We can call blocks and pass in arguments:

```ruby
def my_method(number)
  yield(number)
end

my_method(9) { |number| puts number }
	#  => 9
	#  nil
```

Like methods, blocks always have a return value of the last evaluated expression.
