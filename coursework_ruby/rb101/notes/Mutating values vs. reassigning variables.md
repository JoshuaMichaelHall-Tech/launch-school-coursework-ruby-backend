Reassignment changes the object id bound to a reference. It does not mutate the original object and therefore has no effect on other variables bound to the original object id.

```Ruby
>> greeting = "Hello"
=> "Hello"

>> whazzup = greeting  
=> "Hello"

>> greeting  
=> "Hello"

>> whazzup  
=> "Hello"

>> greeting.object_id  
=> 70101471431160

>> whazzup.object_id  
=> 70101471431160

>> greeting = 'Dude!'  
=> "Dude!"

>> puts greeting  
=> "Dude!"

>> puts whazzup  
=> "Hello!"

>> greeting.object_id  
=> 70101479528400

>> whazzup.object_id  
=> 70101471431160
```

Mutating values, however, changes the object at the object id in memory for all variables pointing to that id.

```Ruby
>> greeting.upcase!  
=> "HELLO"

>> greeting  
=> "HELLO"

>> whazzup  
=> "HELLO"

>> whazzup.concat('!')  
=> "HELLO!"

>> greeting  
=> "HELLO!"

>> whazzup  
=> "HELLO!"

>> greeting.object_id  
=> 70101471431160

>> whazzup.object_id  
=> 70101471431160
```

