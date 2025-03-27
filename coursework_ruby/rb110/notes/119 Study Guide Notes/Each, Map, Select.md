### Each

Called on an array:

```ruby
[1, 2, 3].each do |num|
  puts num
end
# => 1
# => 2
# => 3

```

Calling `each` on a hash looks a little different, since the block has two arguments:

```ruby
hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}"
end
```

### Select

Instead of managing a loop manually with a counter and break condition, we can just do this:

```ruby
[1, 2, 3].select do |num|
  num.odd?
end
```

To perform selection, `select` evaluates the **return value of the block**.

### Map

`map` uses the return value of the block to perform transformation instead of selection.

```ruby
[1, 2, 3].map do |num|
  num * 2
end
```

In this example, the return value of the block is the product of `num` and `2`. `map` then takes this value and places it in a **new collection**.

#### Summary

Methods like `each`, `select` and `map` are provided by Ruby to allow for simpler implementations of common collection manipulation tasks. Using these methods to iterate, select, and transform a collection is preferred over manually looping.

To further clarify your understanding of these methods and how they work, use the following table as a reference:

|Method|Action|Considers the return value of the block?|Returns a new collection from the method?|Length of the returned collection|
|---|---|---|---|---|
|`each`|Iteration|No|No, it returns the original|Length of original|
|`select`|Selection|Yes, its truthiness|Yes|Length of original or less|
|`map`|Transformation|Yes|Yes|Length of original|

These methods each utilize the block's return value in their own way.