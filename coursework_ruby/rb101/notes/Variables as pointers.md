Variables point to objects in memory. When a variable is set to the value of another variable, it creates a pointer to the object in memory to which the other variable points. Thus, they're two separate pointers to the same object in memory. Modifying one of those pointers later does not affect the other.

```Ruby
a = 1  #a -> 1
b = a  #b -> 1
a = 2  #a -> 2 (Does not modify b)
```
