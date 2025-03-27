
# States
### Definition
 State refers to the data associated to an individual object (which are tracked by instance variables).

### Implementation


### Benefits


### Code Snippets

```ruby
class GoodDog
  DOG_YEARS = 7 # State tied to the class

  attr_accessor :name, :age # State tied to objects instantiated from this class.

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age             # => 28
```
------
# Behavior

### Definition
Behaviors are what objects are capable of doing.

### Implementation


### Benefits


### Code Snippets

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end

  def to_s # Defines behavior for objects instantiated from this class.
    "This dog's name is #{name} and it is #{age} in dog years."
  end
end
```