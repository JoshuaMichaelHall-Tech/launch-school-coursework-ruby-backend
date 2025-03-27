
# Instance Variables
### Definition
Instance variables keep track of state and begin with @.  It is a variable that exists as long as the object instance exists and it is one of the ways we tie data to objects.

### Implementation


### Benefits


### Code Snippets
```ruby
class GoodDog
  def initialize(name)
    @name = name # @name is the instance variable
  end
end
```
-----------
# Class Variables
### Definition
Class variables track data for a class.

### Implementation
One use case is keeping track of how many objects are instantiated from this class.

### Benefits


### Code Snippets
```ruby
class GoodDog
  @@number_of_dogs = 0 # This is the class variable.

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs   # => 0

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs   # => 2
```

---------------
# Constants
### Definition
Used for variables that you never want to change. These begin with a capital letter and are usually completely upcased.


### Implementation


### Benefits


### Code Snippets
```ruby
class GoodDog
  DOG_YEARS = 7 # This is the constant

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age             # => 28
```
