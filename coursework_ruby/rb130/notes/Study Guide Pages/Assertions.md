### Common Assertions

| Assertion                          | Description                                    |
| ---------------------------------- | ---------------------------------------------- |
| `assert(test)`                     | Fails unless `test` is truthy.                 |
| `assert_equal(exp, act)`           | Fails unless `exp == act`.                     |
| `assert_nil(obj)`                  | Fails unless `obj` is `nil`.                   |
| `assert_raises(*exp) { ... }`      | Fails unless block raises one of `*exp`.       |
| `assert_instance_of(cls, obj)`     | Fails unless `obj` is an instance of `cls`.    |
| `assert_includes(collection, obj)` | Fails unless `collection` includes `obj`.      |
| `assert_same(exp, act)`            | Fails unless `exp` is the same object as `act` |

Article on testing standard output: https://medium.com/@gilroman/testing-standard-input-and-output-in-ruby-with-the-minitest-framework-5fcc17a39255
#### Examples


```ruby
class Person
  attr_accessor :name, :number_legs

  def initialize(name)
    @name = name
  end
end
```

1. `assert`
        
    ```ruby
    def test_person_exists
      tim = Person.new('Tim')
      assert(tim)
    end
    ```
    
2. `assert_equal`
        
    ```ruby
    def test_name
      tim = Person.new('Tim')
      assert_equal('Tim', tim.name)
    end
    ```
    
3. `assert_nil`
        
    ```ruby
    def test_num_legs_is_nil
      tim = Person.new('Tim')
      assert_nil(tim.number_legs)
    end
    ```
    
4. `assert_raises`
    
    ```ruby
    def test_raise_initialize_with_arg
      assert_raises(ArgumentError) do
        tim = Person.new # this code raises ArgumentError, so this assertion passes
      end
    end
    ```
    
5. `assert_instance_of`
        
    ```ruby
    def test_instance_of_tim
      tim = Person.new('Tim')
      assert_instance_of(Person, tim)
    end
    ```
    
    This test is more useful when dealing with inheritance. This example is a little contrived.
    
6. `assert_includes`
       
    ```ruby
    def test_includes_person
      tim = Person.new('Tim')
      arr = [1, 2, 3]
      arr << car
    
      assert_includes(arr, tim)
    end
    ```


Refutations are the opposite of assertions. Substitute `refute` for `assert`.