# PY120: Object-Oriented Programming with Python - Reference Sheet

## Class Definition and Instantiation

```python
# Defining a class
class MyClass:
    # Class variable
    class_variable = "I am shared among all instances"
    
    # Constructor
    def __init__(self, parameter1, parameter2):
        # Instance variables
        self.parameter1 = parameter1
        self.parameter2 = parameter2
        
    # Instance method
    def instance_method(self):
        return f"Using {self.parameter1} and {self.parameter2}"
    
    # Class method
    @classmethod
    def class_method(cls, arg):
        return f"Class method called with {arg} and {cls.class_variable}"
    
    # Static method
    @staticmethod
    def static_method(arg):
        return f"Static method called with {arg}"

# Creating an instance
my_object = MyClass("value1", "value2")

# Accessing instance variables and methods
print(my_object.parameter1)  # "value1"
print(my_object.instance_method())  # "Using value1 and value2"

# Accessing class variables and methods
print(MyClass.class_variable)  # "I am shared among all instances"
print(MyClass.class_method("arg"))  # "Class method called with arg and I am shared among all instances"
print(MyClass.static_method("arg"))  # "Static method called with arg"
```

## Inheritance

```python
# Parent class
class Animal:
    def __init__(self, name):
        self.name = name
    
    def speak(self):
        pass  # Abstract method to be overridden

# Child class
class Dog(Animal):
    def __init__(self, name, breed):
        # Call parent constructor
        super().__init__(name)
        self.breed = breed
    
    def speak(self):
        return f"{self.name} says Woof!"

# Another child class
class Cat(Animal):
    def speak(self):
        return f"{self.name} says Meow!"

# Using inheritance
dog = Dog("Rex", "German Shepherd")
cat = Cat("Whiskers")

print(dog.name)     # "Rex"
print(dog.breed)    # "German Shepherd"
print(dog.speak())  # "Rex says Woof!"
print(cat.speak())  # "Whiskers says Meow!"

# Checking inheritance
print(isinstance(dog, Dog))    # True
print(isinstance(dog, Animal)) # True
print(isinstance(cat, Dog))    # False
```

## Multiple Inheritance and Mix-ins

```python
# Mix-in class
class SwimmerMixin:
    def swim(self):
        return f"{self.name} is swimming"

# Mix-in class
class FlyerMixin:
    def fly(self):
        return f"{self.name} is flying"

# Using multiple inheritance with mix-ins
class Duck(Animal, SwimmerMixin, FlyerMixin):
    def speak(self):
        return f"{self.name} says Quack!"

duck = Duck("Donald")
print(duck.speak())  # "Donald says Quack!"
print(duck.swim())   # "Donald is swimming"
print(duck.fly())    # "Donald is flying"

# Check Method Resolution Order (MRO)
print(Duck.__mro__)  # Shows the order classes are searched for methods
```

## Properties and Encapsulation

```python
class Person:
    def __init__(self, name, age):
        self._name = name  # Protected attribute (convention)
        self.__age = age   # Private attribute (name mangling)
    
    # Property getter
    @property
    def name(self):
        return self._name
    
    # Property setter
    @name.setter
    def name(self, value):
        if not isinstance(value, str):
            raise TypeError("Name must be a string")
        self._name = value
    
    # Property getter for age
    @property
    def age(self):
        return self.__age
    
    # Property setter for age
    @age.setter
    def age(self, value):
        if not isinstance(value, int) or value < 0:
            raise ValueError("Age must be a positive integer")
        self.__age = value

person = Person("Alice", 30)
print(person.name)  # "Alice" (using the getter)
person.name = "Bob"  # Using the setter
print(person.name)  # "Bob"

# This will raise TypeError
# person.name = 123

# Accessing private attribute directly will fail or give unexpected results
# print(person.__age)  # AttributeError
print(person._Person__age)  # 30 (name mangling, not recommended)
```

## Operator Overloading and Special Methods

```python
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
    # String representation (informal, for users)
    def __str__(self):
        return f"Point({self.x}, {self.y})"
    
    # String representation (formal, for developers)
    def __repr__(self):
        return f"Point({self.x}, {self.y})"
    
    # Equality comparison
    def __eq__(self, other):
        if not isinstance(other, Point):
            return NotImplemented
        return self.x == other.x and self.y == other.y
    
    # Addition
    def __add__(self, other):
        if not isinstance(other, Point):
            return NotImplemented
        return Point(self.x + other.x, self.y + other.y)
    
    # Make object callable
    def __call__(self, factor):
        return Point(self.x * factor, self.y * factor)
    
    # Boolean evaluation
    def __bool__(self):
        return self.x != 0 or self.y != 0

p1 = Point(1, 2)
p2 = Point(3, 4)

print(p1)            # "Point(1, 2)"
print(p1 == p2)      # False
print(p1 + p2)       # "Point(4, 6)"
print(p1(3))         # "Point(3, 6)" (calling the object with a factor)
print(bool(p1))      # True
print(bool(Point(0, 0)))  # False
```

## Context Managers

```python
class DatabaseConnection:
    def __init__(self, db_name):
        self.db_name = db_name
        self.connected = False
    
    def __enter__(self):
        print(f"Connecting to {self.db_name}...")
        self.connected = True
        return self  # Return the object to be used in the with block
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        print(f"Disconnecting from {self.db_name}...")
        self.connected = False
        # Return True to suppress exceptions, False to propagate them
        return False

# Using the context manager
with DatabaseConnection("users_db") as db:
    if db.connected:
        print("Performing database operations...")
# "Disconnecting from users_db..." is automatically called
```

## Exception Handling

```python
# Custom exception
class InsufficientFundsError(Exception):
    def __init__(self, amount, balance):
        self.amount = amount
        self.balance = balance
        self.deficit = amount - balance
        super().__init__(f"Insufficient funds: tried to withdraw {amount} with balance {balance}")

class BankAccount:
    def __init__(self, balance=0):
        self.balance = balance
    
    def withdraw(self, amount):
        if amount > self.balance:
            raise InsufficientFundsError(amount, self.balance)
        self.balance -= amount
        return amount

# Using try/except
account = BankAccount(100)
try:
    account.withdraw(150)
except InsufficientFundsError as e:
    print(f"Error: {e}")
    print(f"You need {e.deficit} more dollars")
finally:
    print(f"Current balance: {account.balance}")
```

## Class Decorators

```python
# Decorator for class methods
def log_calls(func):
    def wrapper(*args, **kwargs):
        print(f"Calling {func.__name__} with args: {args[1:]} and kwargs: {kwargs}")
        return func(*args, **kwargs)
    return wrapper

class Calculator:
    @log_calls
    def add(self, a, b):
        return a + b

calc = Calculator()
result = calc.add(5, 3)  # "Calling add with args: (5, 3) and kwargs: {}"
print(result)  # 8
```

## Type Hinting (Python 3.6+)

```python
from typing import List, Dict, Optional, Union, Tuple

class Student:
    def __init__(self, name: str, age: int, grades: Optional[List[int]] = None) -> None:
        self.name = name
        self.age = age
        self.grades = grades or []
    
    def add_grade(self, grade: int) -> None:
        self.grades.append(grade)
    
    def get_average(self) -> float:
        if not self.grades:
            return 0.0
        return sum(self.grades) / len(self.grades)
    
    @classmethod
    def from_data(cls, data: Dict[str, Union[str, int, List[int]]]) -> 'Student':
        return cls(name=data['name'], age=data['age'], grades=data.get('grades'))

def process_students(students: List[Student]) -> Dict[str, float]:
    return {student.name: student.get_average() for student in students}

# Type hints with functions returning tuples
def get_student_info(student: Student) -> Tuple[str, int, float]:
    return (student.name, student.age, student.get_average())
```

## Design Patterns

```python
# Singleton pattern
class Singleton:
    _instance = None
    
    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

# Factory pattern
class AnimalFactory:
    @staticmethod
    def create_animal(animal_type, name):
        if animal_type == "dog":
            return Dog(name, "Unknown")
        elif animal_type == "cat":
            return Cat(name)
        else:
            raise ValueError(f"Unknown animal type: {animal_type}")

# Usage
singleton1 = Singleton()
singleton2 = Singleton()
print(singleton1 is singleton2)  # True - they are the same instance

dog = AnimalFactory.create_animal("dog", "Buddy")
cat = AnimalFactory.create_animal("cat", "Whiskers")
```

## CRC Card Structure

```
+------------------------+
| Class Name             |
+------------------------+
| Responsibilities       |
| - What it knows        |
| - What it does         |
+------------------------+
| Collaborators          |
| - Other classes it     |
|   works with           |
+------------------------+
```

Example:
```
+------------------------+
| BankAccount            |
+------------------------+
| - Track balance        |
| - Accept deposits      |
| - Process withdrawals  |
| - Report transactions  |
+------------------------+
| - Customer             |
| - Transaction          |
| - Bank                 |
+------------------------+
```
