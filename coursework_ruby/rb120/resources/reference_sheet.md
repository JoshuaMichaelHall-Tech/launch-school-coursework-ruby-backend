# RB120: Object-Oriented Programming - Reference Sheet

## Class and Object Basics

```ruby
# Class definition
class GoodDog
  def initialize(name)
    @name = name  # Instance variable
  end
  
  def speak  # Instance method
    "#{@name} says Arf!"
  end
  
  def self.what_am_i  # Class method
    "I'm a GoodDog class!"
  end
end

# Object instantiation
sparky = GoodDog.new("Sparky")
sparky.speak  # => "Sparky says Arf!"
GoodDog.what_am_i  # => "I'm a GoodDog class!"
```

## Getters and Setters

```ruby
# Manual getter/setter
class Person
  def initialize(name)
    @name = name
  end
  
  def name  # Getter
    @name
  end
  
  def name=(new_name)  # Setter
    @name = new_name
  end
end

# Using attr_* methods
class Person
  attr_reader :name    # Creates getter
  attr_writer :name    # Creates setter
  attr_accessor :name  # Creates both getter and setter
  
  def initialize(name)
    @name = name
  end
end

# Usage
person = Person.new("John")
person.name         # => "John" (getter)
person.name = "Jane"  # Setter
person.name         # => "Jane"
```

## Inheritance and Modules

```ruby
# Class inheritance
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"  # Using super to call parent method
  end
end

sparky = GoodDog.new
sparky.speak  # => "Hello! from GoodDog class"

# Module mixins
module Swimmable
  def swim
    "I'm swimming!"
  end
end

module Walkable
  def walk
    "I'm walking!"
  end
end

class Dog
  include Swimmable  # Mixin
  include Walkable
end

fido = Dog.new
fido.swim  # => "I'm swimming!"
fido.walk  # => "I'm walking!"

# Method lookup path
puts Dog.ancestors  
# => [Dog, Walkable, Swimmable, Object, Kernel, BasicObject]
```

## Method Access Control

```ruby
class Person
  def public_method
    "Anyone can call this"
  end
  
  protected
  def protected_method
    "Only instances of this class or subclasses can call this"
  end
  
  private
  def private_method
    "Only callable within the class itself"
  end
  
  def call_private
    private_method  # Can call private method from within the class
  end
  
  def call_protected
    protected_method
  end
end

class Child < Person
  def call_parent_protected
    protected_method  # Can call parent's protected method
  end
end

person = Person.new
person.public_method      # => "Anyone can call this"
# person.private_method   # NoMethodError
person.call_private       # => "Only callable within the class itself"

child = Child.new
child.call_parent_protected  # => "Only instances of this class or subclasses can call this"
```

## Using `self`

```ruby
class Person
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def change_name(new_name)
    self.name = new_name  # Self refers to the calling object
  end
  
  def introduce
    "Hi, my name is #{name}"  # Implicit self
  end
  
  def self.species  # Class method definition
    "Human"
  end
end

person = Person.new("John")
person.change_name("Jack")
person.name  # => "Jack"
Person.species  # => "Human"
```

## Collaborator Objects

```ruby
class Library
  attr_accessor :books
  
  def initialize
    @books = []
  end
  
  def add_book(book)
    books << book
  end
end

class Book
  attr_reader :title, :author
  
  def initialize(title, author)
    @title = title
    @author = author
  end
end

# Creating collaborator relationship
library = Library.new
book1 = Book.new("1984", "George Orwell")
library.add_book(book1)  # book1 is now a collaborator object

library.books.first.title  # => "1984"
```

## Modules for Namespacing

```ruby
module Animals
  class Dog
    def speak
      "Woof!"
    end
  end
  
  class Cat
    def speak
      "Meow!"
    end
  end
end

dog = Animals::Dog.new
cat = Animals::Cat.new

dog.speak  # => "Woof!"
cat.speak  # => "Meow!"
```

## Method Overriding and super

```ruby
class Animal
  def initialize(name)
    @name = name
  end
  
  def speak
    "#{@name} makes a noise"
  end
end

class Dog < Animal
  def speak
    super + ", specifically a woof!"  # Calls Animal#speak and adds to it
  end
end

class Cat < Animal
  def initialize(name, color)
    super(name)  # Calls Animal#initialize with name argument
    @color = color
  end
  
  def speak
    "#{@name} meows and is #{@color}"
  end
end

fido = Dog.new("Fido")
whiskers = Cat.new("Whiskers", "orange")

fido.speak      # => "Fido makes a noise, specifically a woof!"
whiskers.speak  # => "Whiskers meows and is orange"
```
