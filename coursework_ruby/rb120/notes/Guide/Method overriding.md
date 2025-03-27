### Definition
When an inherited method has the same name as a method lower in the lookup chain, it is overridden by that method. We use super to go up the method chain to implement additional state and behavior which would overwise have been overridden.

### Implementation


### Benefits


### Code Snippets
```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def speak
    "#{self.name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

puts sparky.speak           # => Sparky says arf!
puts paws.speak             # => Hello!
```

