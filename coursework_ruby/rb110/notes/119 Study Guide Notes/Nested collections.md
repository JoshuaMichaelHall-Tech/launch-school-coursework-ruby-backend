Ruby gives us a very convenient way to update array elements.

```ruby
arr = [[1, 3], [2]]
arr[1] = "hi there"
arr                     # => [[1, 3], "hi there"]
```

We can modify a value in a nested array in a similar way.

```ruby
arr = [[1, 3], [2]]
arr[0][1] = 5
```

 How to insert an additional element into an inner array:

```ruby
arr = [[1], [2]]

arr[0] << 3
arr # => [[1, 3], [2]]
```

### Hashes

```ruby
[{ a: 'ant' }, { b: 'bear' }]
```

We want to add a new key/value pair into the first inner hash. Once again, there has to be a two step process: first, reference the first element in the array; next, update the hash.

```ruby
arr = [{ a: 'ant' }, { b: 'bear' }]

arr[0][:c] = 'cat'
arr # => [{ :a => "ant", :c => "cat" }, { :b => "bear" }]
```

