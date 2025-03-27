### Definition
The method lookup path is the order in which classes are inspected when you call a method.

### Implementation


### Benefits


### Code Snippets

```ruby
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end
```


```ruby
puts "---Animal method lookup---"
puts Animal.ancestors

=begin
OUTPUT
---Animal method lookup---
Animal
Walkable
Object
Kernel
BasicObject
```

Transverse mixins, then class, then parent mixins, parent class, etc. Ends with Object -> Kernel -> BasicObject

