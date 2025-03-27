## Transformation

Let's again take a look at a simple array and loop through it, but with one addition: the modification of appending an `'s'` to each string in the array.

```ruby
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  current_element = fruits[counter]

  transformed_elements << (current_element + 's')   # appends transformed string into array

  counter += 1
  break if counter == fruits.size
end

transformed_elements # => ["apples", "bananas", "pears"]
```

## Conversion

`String#chars` returns an array of individual characters.

```ruby
str = 'Practice'

arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]
```

`Array#join` returns a string with the elements of the array joined together.

```ruby
arr.join # => "Practice"
```

`Array#split` returns an array with the words of the string split into array entries.

```ruby
str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"
```

Hash has a `#to_a` method, which returns an array.

```ruby
hsh = { sky: "blue", grass: "green" }
hsh.to_a # => [[:sky, "blue"], [:grass, "green"]]
```

 `Array` has a `#to_h` method, which returns a hash. 

```ruby
arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
arr.to_h # => {:name=>"Joe", :age=>10, :favorite_color=>"blue"}
```

## Element Assignment

### String Element Assignment
  
```ruby
str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"
```

### Array Element Assignment

Similar to how we can assign individual characters in a string using their index, we can assign elements of an array in the same way.

```ruby
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]
```

The statement `arr[0] += 1` in this example is shorthand for `arr[0] = arr[0] + 1`.

### Hash Element Assignment

Hash element assignment is not too dissimilar. The hash key is used instead of assigning a value using an index.

```ruby
hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }
```


