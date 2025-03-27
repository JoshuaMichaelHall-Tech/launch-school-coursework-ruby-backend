1. `assert_equal` tests for _value equality_, invoking the ` == ` method on the object. 
2. `assert_same` checks for  strict _object equality_.

```ruby
require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_value_equality
    str1 = 'hello, world'
    str2 = 'hello, world'

    assert_equal(str1, str2) # Will pass
    assert_same(str1, str2) # Will fail
  end
end

```

#### Testing for Equality in a Custom Class

To use `assert_equal` on a custom class, we must first define a ` == ` method on that class.

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def ==(other)
    other.is_a?(Person) && name = other.name
  end
end

class PersonTest < Minitest::Test
  def test_value_equality
    sam1 = Person.new('Sam')
    sam2 = Person.new('Sam')

    assert_equal(sam1, sam2) # pass
    assert_same(sam1, sam2) # fail
  end
end
```

