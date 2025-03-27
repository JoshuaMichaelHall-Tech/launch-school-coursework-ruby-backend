#### What is sorting?

Sorting is setting the order of the items in a collection according to a certain criterion. For example, if we look at these two arrays of integers:

```ruby
[2, 5, 3, 4, 1]
[1, 2, 3, 4 ,5]
```

Ruby provides a couple of methods that can do this complex work for us: `sort` and `sort_by`.

Going back to our previous example, we could call `sort` on the first array:

```ruby
[2, 5, 3, 4, 1].sort # => [1, 2, 3, 4 ,5]
```

#### Comparison
#### The `<=>` Method

Any object in a collection that we want to sort **must** implement a `<=>` method.
```ruby
2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil
```

We can also call `sort` with a block; this gives us more control over how the items are sorted. The block needs two arguments passed to it (the two items to be compared) and the return value of the block has to be `-1`, `0`, `1` or `nil`.

This is what Array#sort does:

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end
# => [1, 2, 3, 4, 5]
```

#### The `sort_by` method

`sort_by` is similar to `sort` but is usually called with a block. The code in the block determines how the items are compared.

```ruby
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
# => ["mat", "bed", "cot"]
```

When calling `sort_by` on a hash, two arguments need to be passed to the block - the key and the value. In the `people` hash in the following example, the keys are each person's name and the values are their ages.

```ruby
people = { Kate: 27, John: 25, Mike:  18 }
```

`sort_by` always returns an array, even when called on a hash, so the result here is a new array with the key-value pairs as objects in nested arrays. If we need to convert this back into a hash we can call `Array#to_h` on it.

### Additional Sort Methods
- `min`
- `max`
- `minmax`
- `min_by`
- `max_by`
- `minmax_by`

