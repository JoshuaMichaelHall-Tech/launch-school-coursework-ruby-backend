### Definition
 Implemented through the use of _access modifiers_. The purpose of access modifiers is to allow or restrict access to a particular thing, in Ruby this is methods.

### Implementation
 through the use of the `public`, `private`, and `protected` access modifiers. Public = interface, no protection.

Use of `self`:
When in a class/object, and in a public method, self prepended to a method cannot access a private method because self makes the object the caller, which cannot see private methods. In summary, private methods are not accessible outside of the class definition at all, and are only accessible from inside the class when called without `self`.

### Benefits


### Code Snippets

Private
```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
sparky.human_years
```

Protected
```ruby
class Person
  def initialize(age)
    @age = age
  end

  def older?(other_person)
    age > other_person.age
  end

  protected

  attr_reader :age
end

malory = Person.new(64)
sterling = Person.new(42)

malory.older?(sterling)  # => true
sterling.older?(malory)  # => false

malory.age
  # => NoMethodError: protected method `age' called for #<Person: @age=64>
```