`class` method which returns the name of the calling object's class.

```ruby
objects = ['hello', :key, 10, []]
counter = 0

loop do
  break if counter == objects.size
  puts objects[counter].class
  counter += 1
end
```

Hash#keys & Hash#size

```ruby
number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
counter = 0

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end
```

String#include?
assist us in determining whether a character is a vowel.

```ruby
if 'aeiouAEIOU'.include?(current_char)
  selected_chars << current_char
end
```

#### `Enumerable#any?`
 
```ruby
[1, 2, 3].any? do |num|
  num > 2
end
# => true
```

#### `Enumerable#all?`
the method only returns `true` if the block's return value in **every** iteration is truthy (that is, not `false` or `nil`).

```ruby
[1, 2, 3].all? do |num|
  num > 2
end
# => false
```

`all?` can also be called on a hash.

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
# => true
```

#### `Enumerable#each_with_index`
`each_with_index` takes a second argument which represents the index of each element.

```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end

# The index of 1 is 0.
# The index of 2 is 1.
# The index of 3 is 2.
# => [1, 2, 3]
```

When calling `each_with_index` on a hash, the first argument now represents an array containing both the key and the value.

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end

# The index of [:a, "ant"] is 0.
# The index of [:b, "bear"] is 1.
# The index of [:c, "cat"] is 2.
# => { :a => "ant", :b => "bear", :c => "cat" }
```

Finally note that just like `each`, `each_with_index` always returns the original calling collection.

#### `Enumerable#each_with_object`
Besides taking a block like the methods above, `each_with_object` takes a method argument. The method returns the collection object that was passed in.

```ruby
[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
# => [1, 3]
```

Similar to `each_with_index`, the first block argument turns into an array when we invoke `each_with_object` on a hash.

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
# => ["ant", "bear", "cat"]
```

As an additional quirk, it's possible to use parentheses to capture the key and value in the first block argument.

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }
```

#### `Enumerable#first`

`first` doesn't take a block, but it does take an optional argument which represents the number of elements to return. When no argument is given, it returns only the first element in the collection.

```ruby
[1, 2, 3].first
# => 1
```

Let's now try to call `first` on a hash.

```ruby
{ a: "ant", b: "bear", c: "cat" }.first(2)
# => [[:a, "ant"], [:b, "bear"]]
```

#### `Enumerable#include?`

`include?` doesn't take a block, but it does require one argument. It returns `true` if the argument exists in the collection and `false` if it doesn't.

```ruby
[1, 2, 3].include?(1)
# => true
```

When called on a hash, `include?` only checks the keys, not the values.

```ruby
{ a: "ant", b: "bear", c: "cat" }.include?("ant")
# => false

{ a: "ant", b: "bear", c: "cat" }.include?(:a)
# => true
```

 `Hash#include?` is essentially an alias for `Hash#key?` or `Hash#has_key?`.
 If we wanted to find out if a value exists within a hash, we could use the `Hash#value?` or `Hash#has_value?`
 
#### `Enumerable#partition`

`partition` divides up elements in the current collection into two collections, depending on the block's return value. For example:

```ruby
[1, 2, 3].partition do |num|
  num.odd?
end
# => [[1, 3], [2]]
```

#### Array Methods
`min`
[0, 1, 2].min # => 0

`max`
[0, 1, 2].max # => 2

`minmax`
[0, 1, 2].minmax # => [0, 2]

#### Enumerable Methods
`min_by`
(1..4).min_by {|element| -element }                    # => 4

`max_by`
(1..4).max_by {|element| -element }                    # => 1

`minmax_by`
(1..4).minmax_by {|element| -element }              # => [4, 1]