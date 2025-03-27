We define a method to be used later, perhaps multiple times:

```Ruby
def say(words)
  puts words + '.'
end
```

We invoke the method when we want to use it:

```Ruby
say('Hello')
#=> puts Hello. to STDOUT, returns nil.
```