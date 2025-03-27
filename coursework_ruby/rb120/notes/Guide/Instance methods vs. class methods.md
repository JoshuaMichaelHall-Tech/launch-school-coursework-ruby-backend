# Instance Methods
### Definition
Instance methods expose behavior for objects.

### Implementation


### Benefits


### Code Snippets
```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "Arf!"
  end
end

sparky = GoodDog.new("Sparky")
sparky.speak
```

-----
# Class Methods
### Definition
Class level methods. Class methods are methods we can call directly on the class itself, without having to instantiate any objects.

### Implementation
where we put functionality that does not pertain to individual objects.

### Benefits


### Code Snippets
```ruby
# ... rest of code ommitted for brevity

def self.what_am_i         # Class method definition
  "I'm a GoodDog class!"
end
```

