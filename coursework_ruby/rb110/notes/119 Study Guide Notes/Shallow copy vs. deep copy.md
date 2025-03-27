## Shallow Copy
`dup` and `clone` create a _shallow copy_ of an object. This means that only the object that the method is called on is copied. If the object contains other objects - like a nested array - then those objects will be _shared_, not copied.

`dup` allows objects within the copied object to be modified.

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

arr2 # => ["a", "B", "c"]
arr1 # => ["a", "B", "c"]
```

`clone` works the same way.

```ruby
arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!

arr2 # => ["cba", "def"]
arr1 # => ["cba", "def"]
```

The main difference between `dup` and `clone` is that `clone` preserves the frozen state of the object.

### Modifying Array instead of Objects in Array
`map` modifies the array, replacing each element with a new value:

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]
```

## Deep Copy

In Ruby, there's no built-in or easy way to create a deep copy or deep freeze objects within objects.