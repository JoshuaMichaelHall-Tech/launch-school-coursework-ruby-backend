Some objects in Ruby can be mutated, others cannot. Objects and numbers are immutable. When code manipulates immutable objects, it is actually reassignment, not mutation, and the object id will change, not the object in memory.

```Ruby
def add(first, second)
  first += second
end

a = 3
b = 4
a.object_id #7
b.object_id #9
c = add(a, b)
a.object_id #7
b.object_id #9
c.object_id #15
```
