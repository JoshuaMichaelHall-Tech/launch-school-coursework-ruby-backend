1. **Set up** the necessary objects.
2. **Execute** the code against the object we're testing.
3. **Assert** that the executed code did the right thing.
4. **Tear down** and clean up any lingering artifacts.

```ruby
require 'minitest/autorun'

require_relative 'car'

class CarTest < Minitest::Test
  def setup # the setup step
    @car = Car.new
  end

  def test_car_exists # a test
    assert(@car) # the assertion step
  end

  def test_wheels
    assert_equal(4, @car.wheels# the execution step)
  end

  def test_name_is_nil
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: "Joey")
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  def test_includes_car
    arr = [1, 2, 3]
    arr << @car

    assert_includes(arr, @car)
  end

  def teardown # The tear down step
    # For cleaning up files or logging some information, or closing database connections when necessary.
  end 
end
```