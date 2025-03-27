Method definitions define a local variable scope. Variables initialized in a method definition are not accessible from outside the definition and vice versa.

```Ruby
accessable = "I am accessable in method and outside method"

def example_of_scope
  puts accessable
  inaccessable = "I am accessable inside this method, but not outside"
end

example_of_scope #prints "I am accessable in method and outside method" to standard output.
puts inaccessable #returns undefined error
```