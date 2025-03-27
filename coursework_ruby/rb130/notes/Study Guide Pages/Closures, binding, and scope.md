### Closure
##### Definition
In programming, a closure is a block of code that can be passed around. It tracks the methods and variables which it references when defined. 

##### Facts
- In Ruby, implemented through Proc, lambda, or block.
- Retains references to its surrounding artifacts -- its **binding**.
- The scope of a **closure** is its scope where it is defined.

##### Examples


```ruby

# Example 1: passing in a block to the `Integer#times` method.

3.times do |num|
  puts num
end
=> 3

# Example 2: defining a method which takes a block and then yields to the block.

def echo_with_yield(str)
  yield
  str
end

echo_with_yield("hello!") { puts "world" } 
	# world 
	# => "hello!"

```



