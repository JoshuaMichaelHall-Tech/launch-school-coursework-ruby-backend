Default parameters are part of a method definition. They are the arguments passed in to the method when no argument is given at the method invocation. 

```Ruby
def say(words = 'Hello') #Hello is the default parameter.
  puts words + '.'
end

say() # puts Hello.
say('hi') # puts hi.
```
