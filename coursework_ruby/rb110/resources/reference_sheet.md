# RB110: Programming Foundations with Ruby: Intermediate - Reference Sheet

## Collection Iteration Methods

### Basic Iteration

```ruby
# Each - Returns the original collection
[1, 2, 3].each do |num|
  puts num
end
# => [1, 2, 3]

# Hash iteration
{ a: 'ant', b: 'bear' }.each do |key, value|
  puts "#{key}: #{value}"
end
# => { :a => "ant", :b => "bear" }
```

### Transformation

```ruby
# Map - Returns a new array with transformed elements
new_array = [1, 2, 3].map do |num|
  num * 2
end
# => [2, 4, 6]

# Map with hash
{ a: 1, b: 2 }.map do |key, value|
  [key, value * 2]
end
# => [[:a, 2], [:b, 4]]
```

### Selection

```ruby
# Select - Returns elements for which block returns truthy value
even_numbers = [1, 2, 3, 4, 5].select do |num|
  num.even?
end
# => [2, 4]

# Reject - Returns elements for which block returns falsy value
odd_numbers = [1, 2, 3, 4, 5].reject do |num|
  num.even?
end
# => [1, 3, 5]
```

## Working with Nested Collections

```ruby
# Accessing elements in nested arrays
arr = [[1, 3], [2]]
arr[0][1] = 5        # Modifies the nested array
arr                  # => [[1, 5], [2]]

# Accessing nested hashes
hash = { animals: { cats: ['whiskers', 'fluffy'], dogs: ['rover', 'spot'] } }
hash[:animals][:cats][0]  # => "whiskers"

# Iterating over nested arrays
nested_array = [[1, 2], [3, 4]]
nested_array.each do |sub_array|
  sub_array.each do |num|
    puts num
  end
end

# Iterating over nested hashes
pets = {
  cats: { names: ['Fluffy', 'Whiskers'], ages: [3, 5] },
  dogs: { names: ['Spot', 'Rover'], ages: [2, 1] }
}

pets.each do |pet_type, data|
  data.each do |attribute, values|
    puts "#{pet_type} #{attribute}: #{values.join(', ')}"
  end
end
```

## Selection and Transformation with Basic Loops

```ruby
# Selection from a string
alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do
  current_char = alphabet[counter]
  if current_char == 'g'
    selected_chars << current_char
  end
  counter += 1
  break if counter == alphabet.size
end
selected_chars  # => "g"

# Transformation
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  transformed_elements << (fruits[counter] + 's')
  counter += 1
  break if counter == fruits.size
end
transformed_elements  # => ["apples", "bananas", "pears"]
```

## Additional Collection Methods

```ruby
# any? - Returns true if block returns true for any element
[1, 2, 3].any? { |num| num > 2 }  # => true

# all? - Returns true if block returns true for all elements
[1, 2, 3].all? { |num| num > 0 }  # => true

# each_with_index - Provides element and index
['a', 'b', 'c'].each_with_index do |letter, idx|
  puts "#{letter} is at index #{idx}"
end

# each_with_object - Maintains an object throughout iteration
['a', 'b', 'c'].each_with_object([]) do |letter, result|
  result << letter.upcase
end
# => ["A", "B", "C"]

# first - Returns first element or first n elements
[1, 2, 3].first     # => 1
[1, 2, 3].first(2)  # => [1, 2]
```

## Sorting

```ruby
# Basic sort (uses <=> operator)
[3, 1, 2].sort  # => [1, 2, 3]

# Custom sort with block
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]  # Sort by second character
end
# => ["mat", "bed", "cot"]

# Sort with custom comparison
[1, 2, 3, 4, 5].sort do |a, b|
  b <=> a  # Sort in descending order
end
# => [5, 4, 3, 2, 1]

# Sorting nested structures
people = [
  {name: 'Joe', age: 30},
  {name: 'Jane', age: 25},
  {name: 'Jim', age: 35}
]

people.sort_by { |person| person[:age] }
# => [{:name=>"Jane", :age=>25}, {:name=>"Joe", :age=>30}, {:name=>"Jim", :age=>35}]
```

## Shallow vs. Deep Copy

```ruby
# Shallow copy with dup
arr1 = ["a", "b", ["c", "d"]]
arr2 = arr1.dup

# Modifying a nested element affects both arrays
arr2[2][0] = "X"
arr1  # => ["a", "b", ["X", "d"]]
arr2  # => ["a", "b", ["X", "d"]]

# But modifying the array itself only affects arr2
arr2[0] = "Z"
arr1  # => ["a", "b", ["X", "d"]]
arr2  # => ["Z", "b", ["X", "d"]]

# clone works similarly but preserves frozen state
```
