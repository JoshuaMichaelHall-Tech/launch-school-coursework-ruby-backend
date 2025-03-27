```ruby
def message(msg)
  yield(msg)

end

message("Hello World") { |msg| puts msg }
```

```Ruby  
def message_2(&msg)
  msg.call

end

message_2 {puts "hello world"}
```

