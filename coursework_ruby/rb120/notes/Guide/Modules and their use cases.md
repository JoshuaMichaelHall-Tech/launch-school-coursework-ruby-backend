### Definition
 A **module** is a collection of behaviors that is usable in other classes via **mixins**. A module is "mixed in" to a class using the `include` method invocation. Modules are used to group behavior.

### Implementation
Used for a non-hierarchical form of inheritance. While a class can only have 1 parent, it can mix in many modules. Used for has-a relationships.

Used for namespacing, and container for methods.  In this context, namespacing means organizing similar classes under a module.

### Benefits


### Code Snippets
Namespacing
```ruby
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end

buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak('Arf!')           # => "Arf!"
kitty.say_name('kitty')       # => "kitty"
```

Container
```ruby
module Mammal
  ...

  def self.some_out_of_place_method(num)
    num ** 2
  end
end

value = Mammal.some_out_of_place_method(4) #Preferred

value = Mammal::some_out_of_place_method(4)
```

