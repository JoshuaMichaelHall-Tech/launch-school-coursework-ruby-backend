Closures are formed by blocks, `Proc` objects, and `lambda`s. They retain a memory of their surrounding scope and can use and even update variables in that scope when they are executed, even if the block, `Proc`, or `lambda` is called from somewhere else. For instance:

```ruby
def for_each_in(arr)
  arr.each { |element| yield element }
end

arr = [1, 2, 3, 4, 5]
results = [0]

for_each_in(arr) do |number|
  total = results[-1] + number
  results.push(total)
end

p results # => [0, 1, 3, 6, 10, 15]
```

