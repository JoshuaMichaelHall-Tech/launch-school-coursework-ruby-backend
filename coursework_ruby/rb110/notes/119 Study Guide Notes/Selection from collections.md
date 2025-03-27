##Selection
In the example below, we want to select all `'g'` characters out of a string. You'll notice that this is just a basic loop with one main addition: the `if` statement.


```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do
  current_char = alphabet[counter]

  if current_char == 'g'
    selected_chars << current_char    # appends current_char into the selected_chars string
  end

  counter += 1
  break if counter == alphabet.size
end

selected_chars # => "g"
```

