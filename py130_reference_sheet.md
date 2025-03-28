# PY130: More Python Foundations - Reference Sheet

## First-Class and Higher-Order Functions

```python
# Assigning functions to variables
def greet(name):
    return f"Hello, {name}!"

greeting = greet  # Assign function to variable
print(greeting("Alice"))  # "Hello, Alice!"

# Functions as arguments
def apply(func, value):
    return func(value)

def square(x):
    return x * x

print(apply(square, 5))  # 25

# Functions that return functions
def create_multiplier(factor):
    def multiplier(x):
        return x * factor
    return multiplier

double = create_multiplier(2)
triple = create_multiplier(3)
print(double(5))  # 10
print(triple(5))  # 15

# Functions in data structures
function_list = [len, str.upper, str.lower]
text = "Python"
print([func(text) for func in function_list])  # [6, 'PYTHON', 'python']
```

## Lambda Functions

```python
# Basic lambda
square = lambda x: x * x
print(square(5))  # 25

# Lambda with multiple parameters
add = lambda x, y: x + y
print(add(3, 4))  # 7

# Lambda with conditionals
is_even = lambda x: x % 2 == 0
print(is_even(4))  # True
print(is_even(5))  # False

# Lambda in sorting
people = [("Alice", 25), ("Bob", 30), ("Charlie", 20)]
people.sort(key=lambda person: person[1])  # Sort by age
print(people)  # [('Charlie', 20), ('Alice', 25), ('Bob', 30)]

# Lambda with map and filter
numbers = [1, 2, 3, 4, 5]
squared = list(map(lambda x: x * x, numbers))
print(squared)  # [1, 4, 9, 16, 25]

evens = list(filter(lambda x: x % 2 == 0, numbers))
print(evens)  # [2, 4]
```

## Closures and Decorators

```python
# Simple closure
def outer_function(message):
    def inner_function():
        print(message)  # Access variable from outer scope
    return inner_function

hello_func = outer_function("Hello, world!")
hello_func()  # "Hello, world!"

# Basic decorator
def my_decorator(func):
    def wrapper():
        print("Before function call")
        func()
        print("After function call")
    return wrapper

@my_decorator
def say_hello():
    print("Hello!")

say_hello()
# "Before function call"
# "Hello!"
# "After function call"

# Decorator with arguments
def repeat(n):
    def decorator(func):
        def wrapper(*args, **kwargs):
            for _ in range(n):
                result = func(*args, **kwargs)
            return result
        return wrapper
    return decorator

@repeat(3)
def say_hi(name):
    print(f"Hi, {name}!")
    return name

say_hi("Alice")
# "Hi, Alice!"
# "Hi, Alice!"
# "Hi, Alice!"

# Preserving function metadata with functools.wraps
from functools import wraps

def logged(func):
    @wraps(func)  # Preserves function metadata
    def wrapper(*args, **kwargs):
        print(f"Calling {func.__name__}")
        return func(*args, **kwargs)
    return wrapper

@logged
def add(x, y):
    """Add two numbers"""
    return x + y

print(add.__name__)  # "add" (preserved by wraps)
print(add.__doc__)   # "Add two numbers" (preserved by wraps)
```

## Generators and Iteration

```python
# Simple generator function
def count_up_to(n):
    i = 0
    while i < n:
        yield i
        i += 1

counter = count_up_to(3)
print(next(counter))  # 0
print(next(counter))  # 1
print(next(counter))  # 2
# print(next(counter))  # StopIteration error

# Using a generator in a for loop
for num in count_up_to(3):
    print(num)  # 0, 1, 2

# Generator expression
squares = (x * x for x in range(5))
print(list(squares))  # [0, 1, 4, 9, 16]

# yield from - delegating to another generator
def gen1():
    yield 1
    yield 2

def gen2():
    yield 'a'
    yield from gen1()  # Delegate to gen1
    yield 'b'

print(list(gen2()))  # ['a', 1, 2, 'b']

# Custom iterator class
class CountUpTo:
    def __init__(self, max_value):
        self.max_value = max_value
    
    def __iter__(self):
        self.current = 0
        return self
    
    def __next__(self):
        if self.current < self.max_value:
            result = self.current
            self.current += 1
            return result
        else:
            raise StopIteration

# Using the custom iterator
for num in CountUpTo(3):
    print(num)  # 0, 1, 2
```

## File Operations

```python
# Writing to a text file
with open('example.txt', 'w') as file:
    file.write("Hello, world!\n")
    file.write("Python is awesome!\n")

# Reading from a text file
with open('example.txt', 'r') as file:
    content = file.read()
    print(content)

# Reading line by line
with open('example.txt', 'r') as file:
    for line in file:
        print(line.strip())

# Reading specific number of bytes
with open('example.txt', 'rb') as file:  # 'rb' for binary mode
    chunk = file.read(5)  # Read first 5 bytes
    print(chunk)  # b'Hello'

# Seeking to a specific position
with open('example.txt', 'r') as file:
    file.seek(7)  # Move to the 8th byte
    print(file.read(5))  # "world"

# Appending to a file
with open('example.txt', 'a') as file:
    file.write("Appended text.\n")

# Working with CSV files
import csv

# Writing CSV
with open('data.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Name', 'Age'])
    writer.writerow(['Alice', 25])
    writer.writerow(['Bob', 30])

# Reading CSV
with open('data.csv', 'r', newline='') as file:
    reader = csv.reader(file)
    for row in reader:
        print(row)

# Working with JSON files
import json

data = {'name': 'Alice', 'age': 25, 'is_student': True}

# Writing JSON
with open('data.json', 'w') as file:
    json.dump(data, file, indent=4)

# Reading JSON
with open('data.json', 'r') as file:
    loaded_data = json.load(file)
    print(loaded_data)
```

## Advanced Function Parameters

```python
# Default parameters
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"

print(greet("Alice"))  # "Hello, Alice!"
print(greet("Bob", "Hi"))  # "Hi, Bob!"

# Variable-length positional arguments (*args)
def sum_all(*numbers):
    return sum(numbers)

print(sum_all(1, 2, 3, 4))  # 10

# Variable-length keyword arguments (**kwargs)
def user_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

user_info(name="Alice", age=25, city="New York")
# "name: Alice"
# "age: 25"
# "city: New York"

# Mixing different parameter types
def example(pos1, pos2, /, pos_or_kw, *, kw1, kw2):
    # pos1, pos2 are positional-only
    # pos_or_kw can be positional or keyword
    # kw1, kw2 are keyword-only
    print(pos1, pos2, pos_or_kw, kw1, kw2)

example(1, 2, 3, kw1=4, kw2=5)  # Valid
example(1, 2, pos_or_kw=3, kw1=4, kw2=5)  # Valid
# example(pos1=1, pos2=2, pos_or_kw=3, kw1=4, kw2=5)  # Error: pos1 and pos2 are positional-only

# Argument unpacking
def add(a, b, c):
    return a + b + c

numbers = [1, 2, 3]
print(add(*numbers))  # 6 (unpacks list into positional arguments)

params = {'a': 1, 'b': 2, 'c': 3}
print(add(**params))  # 6 (unpacks dict into keyword arguments)
```

## Module and Package Creation

```python
# File structure for a simple package
"""
my_package/
    __init__.py
    module1.py
    module2.py
    subpackage/
        __init__.py
        submodule.py
"""

# __init__.py (main package)
"""
# Import specific modules when the package is imported
from . import module1, module2

# Define what's available with 'from my_package import *'
__all__ = ['module1', 'module2']

# Package-level variables or functions
PACKAGE_VERSION = '1.0.0'
"""

# module1.py
"""
def function1():
    return "This is function1 from module1"

class Class1:
    def __init__(self):
        self.value = "Class1 instance"
"""

# Importing from a package
"""
# Absolute imports
import my_package
import my_package.module1
from my_package import module1
from my_package.module1 import function1, Class1

# Relative imports (from within the package)
# In my_package/module2.py:
from . import module1  # Import sibling module
from .module1 import function1  # Import from sibling
from .subpackage import submodule  # Import from child package
from .. import another_package  # Import from parent level
"""

# Creating a setup.py for distribution
"""
from setuptools import setup, find_packages

setup(
    name="my_package",
    version="1.0.0",
    packages=find_packages(),
    install_requires=[
        "requests>=2.25.1",
        "numpy>=1.20.0",
    ],
    author="Your Name",
    author_email="your.email@example.com",
    description="A short description of your package",
    keywords="python, example, package",
    url="https://github.com/yourusername/my_package",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
    ],
    python_requires=">=3.6",
)
"""

# Building and publishing a package
"""
# Generate distribution archives
python setup.py sdist bdist_wheel

# Upload to PyPI
pip install twine
twine upload dist/*
"""
```

## Testing with unittest

```python
# File: calculator.py
def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

def divide(a, b):
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

# File: test_calculator.py
import unittest
from calculator import add, subtract, multiply, divide

class TestCalculator(unittest.TestCase):
    # Setup method called before each test
    def setUp(self):
        print("Setting up test")
        self.a = 10
        self.b = 5
    
    # Teardown method called after each test
    def tearDown(self):
        print("Tearing down test")
    
    # Test methods must start with 'test_'
    def test_add(self):
        self.assertEqual(add(self.a, self.b), 15)
        self.assertEqual(add(-1, 1), 0)
        self.assertEqual(add(0, 0), 0)
    
    def test_subtract(self):
        self.assertEqual(subtract(self.a, self.b), 5)
        self.assertEqual(subtract(1, 1), 0)
        self.assertEqual(subtract(0, 5), -5)
    
    def test_multiply(self):
        self.assertEqual(multiply(self.a, self.b), 50)
        self.assertEqual(multiply(0, 5), 0)
        self.assertEqual(multiply(-1, -1), 1)
    
    def test_divide(self):
        self.assertEqual(divide(self.a, self.b), 2)
        self.assertEqual(divide(0, 5), 0)
        self.assertEqual(divide(-10, 2), -5)
        
        # Test exception is raised
        with self.assertRaises(ValueError):
            divide(10, 0)

    # Skip a test
    @unittest.skip("Demonstrating skipping")
    def test_skipped(self):
        self.fail("Should not run this test")
    
    # Skip conditionally
    @unittest.skipIf(True, "Demonstrating conditional skip")
    def test_skip_if(self):
        self.fail("Should not run this test")
    
    # Test expected to fail
    @unittest.expectedFailure
    def test_expected_failure(self):
        self.assertEqual(1, 2)  # This will fail

# Run the tests
if __name__ == '__main__':
    unittest.main()

# Run from command line
# python -m unittest test_calculator.py

# Run with verbose output
# python -m unittest -v test_calculator.py
```

## Mocking in Tests

```python
import unittest
from unittest.mock import Mock, MagicMock, patch, call

def get_user_data(user_id):
    # Assume this makes an API call
    pass

class MyService:
    def __init__(self, data_provider):
        self.data_provider = data_provider
    
    def process_user(self, user_id):
        data = self.data_provider(user_id)
        if data:
            return f"Processed {data['name']}"
        return "User not found"

class TestMyService(unittest.TestCase):
    def test_process_user_with_mock(self):
        # Create a mock
        mock_provider = Mock()
        
        # Configure the mock
        mock_provider.return_value = {"name": "Alice", "id": 123}
        
        # Use the mock
        service = MyService(mock_provider)
        result = service.process_user(123)
        
        # Assertions
        self.assertEqual(result, "Processed Alice")
        mock_provider.assert_called_once_with(123)
    
    def test_process_user_not_found(self):
        mock_provider = Mock(return_value=None)
        service = MyService(mock_provider)
        result = service.process_user(999)
        self.assertEqual(result, "User not found")
    
    @patch('__main__.get_user_data')
    def test_with_patch(self, mock_get_user_data):
        # Configure the patched function
        mock_get_user_data.return_value = {"name": "Bob", "id": 456}
        
        # Use the real function name, but it's patched
        service = MyService(get_user_data)
        result = service.process_user(456)
        
        self.assertEqual(result, "Processed Bob")
        mock_get_user_data.assert_called_once_with(456)
    
    def test_magic_mock(self):
        # MagicMock automatically implements magic methods
        magic = MagicMock()
        magic.__len__.return_value = 5
        
        self.assertEqual(len(magic), 5)
        
        # Configure to track multiple calls
        magic.method.side_effect = [1, 2, 3]
        self.assertEqual(magic.method(), 1)
        self.assertEqual(magic.method(), 2)
        self.assertEqual(magic.method(), 3)
        
        # Check call history
        magic.reset_mock()
        magic.some_method(1, 2)
        magic.some_method(3, 4)
        
        expected_calls = [call(1, 2), call(3, 4)]
        self.assertEqual(magic.some_method.mock_calls, expected_calls)
```

## Code Coverage

```bash
# Install coverage.py
pip install coverage

# Run tests with coverage
coverage run -m unittest discover

# Generate coverage report
coverage report

# Generate HTML report
coverage html

# Specify source directories
coverage run --source=mypackage -m unittest discover
```

```python
# .coveragerc file for configuration
"""
[run]
source = mypackage
omit = */tests/*

[report]
exclude_lines =
    pragma: no cover
    def __repr__
    raise NotImplementedError
    if __name__ == .__main__.:
    pass
    raise ImportError

[html]
directory = htmlcov
"""
```

## Virtual Environments and Package Management

```bash
# Create a virtual environment
python -m venv myenv

# Activate virtual environment
# On Windows:
myenv\Scripts\activate
# On Unix/macOS:
source myenv/bin/activate

# Deactivate virtual environment
deactivate

# Install a package
pip install package_name

# Install a specific version
pip install package_name==1.2.3

# Install from requirements file
pip install -r requirements.txt

# Create requirements file
pip freeze > requirements.txt

# Install a package in development mode
pip install -e .

# Upgrade a package
pip install --upgrade package_name

# Uninstall a package
pip uninstall package_name
```

## Functional Programming Tools

```python
from functools import reduce, partial

# Map: Apply a function to each item in an iterable
numbers = [1, 2, 3, 4, 5]
squared = list(map(lambda x: x * x, numbers))
print(squared)  # [1, 4, 9, 16, 25]

# Filter: Filter items based on a predicate
evens = list(filter(lambda x: x % 2 == 0, numbers))
print(evens)  # [2, 4]

# Reduce: Apply a function cumulatively to items in an iterable
sum_all = reduce(lambda x, y: x + y, numbers)
print(sum_all)  # 15 (1+2+3+4+5)

# Partial: Create a new function with some arguments fixed
def power(base, exponent):
    return base ** exponent

square = partial(power, exponent=2)
cube = partial(power, exponent=3)

print(square(4))  # 16
print(cube(4))    # 64

# Composing functions
def compose(*functions):
    def inner(arg):
        result = arg
        for f in reversed(functions):
            result = f(result)
        return result
    return inner

def add_one(x): return x + 1
def double(x): return x * 2
def square(x): return x * x

# Compose the functions: square(double(add_one(x)))
composed = compose(square, double, add_one)
print(composed(3))  # 64 (square(double(add_one(3))) = square(double(4)) = square(8) = 64)
```

## Memory Management and Garbage Collection

```python
import sys
import gc
import weakref

# Show reference count
a = [1, 2, 3]
print(sys.getrefcount(a) - 1)  # Subtract 1 for the getrefcount parameter

# Create a reference
b = a
print(sys.getrefcount(a) - 1)  # Increased by 1

# Delete a reference
del b
print(sys.getrefcount(a) - 1)  # Decreased by 1

# Cyclic references
class Node:
    def __init__(self, name):
        self.name = name
        self.neighbors = []
    
    def __del__(self):
        print(f"Node {self.name} is being deleted")

# Create nodes with cyclic references
node1 = Node("A")
node2 = Node("B")
node1.neighbors.append(node2)
node2.neighbors.append(node1)

# Delete references (nodes won't be collected immediately due to cycle)
del node1
del node2

# Force garbage collection
gc.collect()  # Nodes should be deleted now

# Weak references
class Resource:
    def __init__(self, name):
        self.name = name
    
    def __del__(self):
        print(f"Resource {self.name} is being deleted")

# Create an object and a weak reference to it
resource = Resource("DB Connection")
weak_ref = weakref.ref(resource)

# Get the referenced object (if it exists)
print(weak_ref())  # <__main__.Resource object at ...>

# Delete the strong reference
del resource

# The weak reference now returns None
print(weak_ref())  # None
```
