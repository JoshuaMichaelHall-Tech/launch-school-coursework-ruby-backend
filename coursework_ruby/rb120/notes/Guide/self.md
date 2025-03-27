### Definition


### Implementation
Used before instance methods to alert Ruby to look for a method rather than set a new local variable. Also used before class methods to distinguish them from instance methods.

When an instance method uses `self`, it references the _calling object_. In this case, that's the `sparky` object. Therefore, from within the `change_info` method, calling `self.name=` acts the same as calling `sparky.name=` from _outside_ the class (you can't call `sparky.name=` inside the class, though, since it isn't in scope).

### Benefits


### Code Snippets


