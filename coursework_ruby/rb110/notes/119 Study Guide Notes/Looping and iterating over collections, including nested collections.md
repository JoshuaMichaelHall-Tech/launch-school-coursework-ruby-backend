# Looping


```ruby
arr = [1, 2, 3, 4, 5]
counter = 0

loop do
  arr[counter] += 1
  counter += 1
  break if counter == arr.size
end

arr # => [2, 3, 4, 5, 6]
```

### Iteration

```ruby
arr = [1, 2, 3]

arr.each do |e|
  e += 1
end
```


**`if` modifier**

```ruby
break if number == 5
```

#### Next

```ruby
counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end
```


## For Loop
So far, we've been using the `Kernel#loop` method in the examples to illustrate how to loop over a collection. But that's just one of many different ways to loop in Ruby. For example, the `for` loop produces the same result as `loop`:

Copy Code

```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'

for char in alphabet.chars
  puts char
end
```

