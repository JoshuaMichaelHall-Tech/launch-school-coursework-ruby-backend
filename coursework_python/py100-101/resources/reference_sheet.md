# PY100-101: Programming & Back-end Prep with Python - Reference Sheet

## Basic Syntax and Data Types

```python
# Comments start with a hash symbol

# Variables and Assignment
name = "John"           # String
age = 30                # Integer
height = 5.9            # Float
is_student = True       # Boolean

# Print to console
print("Hello, World!")

# String operations
first_name = "John"
last_name = "Doe"
full_name = first_name + " " + last_name  # Concatenation
greeting = f"Hello, {full_name}!"         # f-string formatting
multiline_string = """This is a
multiline string"""

# Basic string methods
name = "John Doe"
name.upper()         # "JOHN DOE"
name.lower()         # "john doe"
name.strip()         # Removes whitespace from beginning and end
name.replace("J", "K")  # "Kohn Doe"
name.split(" ")      # ["John", "Doe"]
",".join(["a", "b", "c"])  # "a,b,c"

# String indexing and slicing
s = "Python"
s[0]      # 'P'
s[-1]     # 'n'
s[0:2]    # 'Py'
s[:2]     # 'Py'
s[2:]     # 'thon'
s[::2]    # 'Pto'

# Numeric operations
x = 10
y = 3
x + y     # 13 (addition)
x - y     # 7 (subtraction)
x * y     # 30 (multiplication)
x / y     # 3.3333... (division)
x // y    # 3 (floor division)
x % y     # 1 (modulo)
x ** y    # 1000 (exponentiation)

# Type conversion
int("123")     # 123
float("12.34") # 12.34
str(123)       # "123"
bool(0)        # False
bool(1)        # True
list("abc")    # ['a', 'b', 'c']
```

## Control Flow

```python
# Conditional statements
if x > 10:
    print("x is greater than 10")
elif x == 10:
    print("x equals 10")
else:
    print("x is less than 10")

# Short-circuit evaluation
result = x > 10 and "Greater than 10" or "Not greater than 10"

# Ternary operator (conditional expression)
result = "Greater than 10" if x > 10 else "Not greater than 10"

# While loop
count = 0
while count < 5:
    print(count)
    count += 1

# For loop with range
for i in range(5):     # 0, 1, 2, 3, 4
    print(i)

# Range with start, stop, step
for i in range(1, 10, 2):  # 1, 3, 5, 7, 9
    print(i)

# For loop with iterable
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)

# Loop control statements
for i in range(10):
    if i == 3:
        continue    # Skip the rest of the current iteration
    if i == 8:
        break       # Exit the loop entirely
    print(i)

# Enumerate for index and value
for index, value in enumerate(fruits):
    print(f"Index {index}: {value}")
```

## Data Structures

```python
# Lists (mutable ordered sequences)
fruits = ["apple", "banana", "cherry"]
fruits[0]              # "apple"
fruits[-1]             # "cherry"
fruits.append("date")  # Add to end
fruits.insert(1, "blueberry")  # Insert at position
fruits.remove("banana")  # Remove by value
fruits.pop()           # Remove and return last item
fruits.pop(0)          # Remove and return item at index 0
fruits.index("cherry") # Get index of value
len(fruits)            # Number of items
sorted(fruits)         # Return sorted copy
fruits.sort()          # Sort in place
fruits.reverse()       # Reverse in place
"apple" in fruits      # Check membership

# List comprehensions
squares = [x**2 for x in range(10)]  # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
evens = [x for x in range(10) if x % 2 == 0]  # [0, 2, 4, 6, 8]

# Tuples (immutable ordered sequences)
coordinates = (10, 20)
x, y = coordinates     # Unpacking
empty_tuple = ()
single_item = (1,)     # Note the comma

# Dictionaries (mutable key-value mappings)
person = {
    "name": "John",
    "age": 30,
    "city": "New York"
}
person["name"]           # Access by key
person.get("age")        # Access with default
person.get("height", 0)  # Default if key not found
person["email"] = "john@example.com"  # Add or update
del person["city"]       # Delete key-value pair
person.keys()            # View of keys
person.values()          # View of values
person.items()           # View of (key, value) pairs
"name" in person         # Check if key exists

# Dictionary comprehension
square_dict = {x: x**2 for x in range(5)}  # {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}

# Sets (unordered collections of unique elements)
fruits_set = {"apple", "banana", "cherry"}
fruits_set.add("date")  # Add element
fruits_set.remove("banana")  # Remove element (raises error if not found)
fruits_set.discard("kiwi")  # Remove if present (no error if not found)
fruits_set.update(["grape", "orange"])  # Add multiple items

# Set operations
set1 = {1, 2, 3}
set2 = {3, 4, 5}
set1 | set2  # Union: {1, 2, 3, 4, 5}
set1 & set2  # Intersection: {3}
set1 - set2  # Difference: {1, 2}
set1 ^ set2  # Symmetric difference: {1, 2, 4, 5}
```

## Functions

```python
# Defining a function
def greet(name):
    return f"Hello, {name}!"

# Calling a function
message = greet("John")  # "Hello, John!"

# Default parameters
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"

greet("John")          # "Hello, John!"
greet("John", "Hi")    # "Hi, John!"

# Keyword arguments
def create_profile(name, age, city):
    return f"{name}, {age}, {city}"

create_profile(name="John", age=30, city="New York")
create_profile(city="New York", age=30, name="John")  # Order doesn't matter

# Variable number of arguments
def sum_all(*args):  # Positional arguments as tuple
    return sum(args)

sum_all(1, 2, 3, 4)  # 10

# Variable number of keyword arguments
def print_info(**kwargs):  # Keyword arguments as dictionary
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_info(name="John", age=30, city="New York")

# Mixing parameter types
def func(pos_only, /, pos_or_kw, *, kw_only):
    print(pos_only, pos_or_kw, kw_only)

# Lambda functions (anonymous functions)
square = lambda x: x ** 2
square(5)  # 25

# Higher-order functions
def apply_twice(func, arg):
    return func(func(arg))

apply_twice(lambda x: x * 2, 3)  # 12
```

## File I/O

```python
# Reading a file
with open("file.txt", "r") as file:
    content = file.read()  # Read entire file
    
with open("file.txt", "r") as file:
    lines = file.readlines()  # Read into list of lines
    
with open("file.txt", "r") as file:
    for line in file:  # Process line by line
        print(line.strip())

# Writing to a file
with open("output.txt", "w") as file:  # Overwrite
    file.write("Hello, World!\n")
    file.write("Another line.\n")

with open("output.txt", "a") as file:  # Append
    file.write("Appended line.\n")

# Reading/writing binary files
with open("file.bin", "rb") as file:
    binary_data = file.read()

with open("output.bin", "wb") as file:
    file.write(binary_data)
```

## Error Handling

```python
# Try-except blocks
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero!")

# Handling multiple exceptions
try:
    value = int(input("Enter a number: "))
    result = 10 / value
except ValueError:
    print("Invalid input: not a number!")
except ZeroDivisionError:
    print("Cannot divide by zero!")

# Catching any exception
try:
    # Risky code
    pass
except Exception as e:
    print(f"An error occurred: {e}")

# Finally clause (always executed)
try:
    file = open("file.txt", "r")
    content = file.read()
except FileNotFoundError:
    print("File not found!")
finally:
    if 'file' in locals() and not file.closed:
        file.close()

# With statement (context manager)
try:
    with open("file.txt", "r") as file:
        content = file.read()
except FileNotFoundError:
    print("File not found!")

# Raising exceptions
def divide(a, b):
    if b == 0:
        raise ValueError("Cannot divide by zero!")
    return a / b
```

## Modules and Packages

```python
# Importing modules
import math
math.sqrt(16)  # 4.0

# Importing specific items from a module
from math import sqrt, pi
sqrt(16)  # 4.0

# Importing with alias
import math as m
m.sqrt(16)  # 4.0

# Importing everything (not recommended)
from math import *
sqrt(16)  # 4.0

# Creating a module (in file mymodule.py)
def greet(name):
    return f"Hello, {name}!"

PI = 3.14159

# Using a custom module
import mymodule
mymodule.greet("John")
mymodule.PI
```

## Virtual Environments

```bash
# Creating a virtual environment
python -m venv myenv

# Activating a virtual environment
# On Windows
myenv\Scripts\activate
# On macOS/Linux
source myenv/bin/activate

# Deactivating a virtual environment
deactivate

# Installing packages
pip install package_name
pip install -r requirements.txt

# Listing installed packages
pip list

# Freezing requirements
pip freeze > requirements.txt
```

## Debugging

```python
# Print debugging
print(f"Debug: variable x = {x}")

# Assertions
assert x > 0, "x must be positive"

# Using the debugger
import pdb
pdb.set_trace()  # Start the debugger at this point

# Using Python's -m pdb
# Run script with debugger: python -m pdb script.py

# Common debugger commands
# n (next) - Execute current line and move to next
# s (step) - Step into function call
# c (continue) - Continue execution until next breakpoint
# p (print) - Print expression
# l (list) - List source code
# q (quit) - Quit the debugger
```
