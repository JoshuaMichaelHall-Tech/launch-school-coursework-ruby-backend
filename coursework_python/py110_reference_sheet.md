# PY110: Programming Foundations with Python: Intermediate - Reference Sheet

## Collections and Data Structures

```python
# Lists
my_list = [1, 2, 3, 4, 5]
my_list.append(6)                   # Add to end: [1, 2, 3, 4, 5, 6]
my_list.extend([7, 8])              # Extend with iterable: [1, 2, 3, 4, 5, 6, 7, 8]
my_list.insert(0, 0)                # Insert at index: [0, 1, 2, 3, 4, 5, 6, 7, 8]
my_list.remove(3)                   # Remove first occurrence: [0, 1, 2, 4, 5, 6, 7, 8]
popped = my_list.pop()              # Remove and return last item: 8, list becomes [0, 1, 2, 4, 5, 6, 7]
popped_index = my_list.pop(2)       # Remove and return item at index: 2, list becomes [0, 1, 4, 5, 6, 7]
my_list.clear()                     # Remove all items: []
my_list = [3, 1, 4, 1, 5, 9]
my_list.index(4)                    # First index of value: 2
my_list.count(1)                    # Count occurrences: 2
my_list.sort()                      # Sort in place: [1, 1, 3, 4, 5, 9]
my_list.reverse()                   # Reverse in place: [9, 5, 4, 3, 1, 1]
new_list = my_list.copy()           # Shallow copy

# Tuples
my_tuple = (1, 2, 3, 4, 5)
len(my_tuple)                       # Length: 5
my_tuple[0]                         # Access element: 1
my_tuple.count(3)                   # Count occurrences: 1
my_tuple.index(4)                   # First index of value: 3
a, b, *rest = my_tuple              # Unpacking: a=1, b=2, rest=[3, 4, 5]

# Sets
my_set = {1, 2, 3, 4, 5}
my_set.add(6)                       # Add element: {1, 2, 3, 4, 5, 6}
my_set.update([7, 8, 9])            # Add multiple elements: {1, 2, 3, 4, 5, 6, 7, 8, 9}
my_set.remove(5)                    # Remove element (raises KeyError if not found)
my_set.discard(10)                  # Remove if present (no error if not found)
popped = my_set.pop()               # Remove and return arbitrary element
my_set.clear()                      # Remove all elements

set_a = {1, 2, 3, 4}
set_b = {3, 4, 5, 6}
set_a.union(set_b)                  # Union: {1, 2, 3, 4, 5, 6}
set_a | set_b                       # Union (operator): {1, 2, 3, 4, 5, 6}
set_a.intersection(set_b)           # Intersection: {3, 4}
set_a & set_b                       # Intersection (operator): {3, 4}
set_a.difference(set_b)             # Difference: {1, 2}
set_a - set_b                       # Difference (operator): {1, 2}
set_a.symmetric_difference(set_b)   # Symmetric difference: {1, 2, 5, 6}
set_a ^ set_b                       # Symmetric difference (operator): {1, 2, 5, 6}
set_a.issubset(set_b)               # Is subset: False
set_a <= set_b                      # Is subset (operator): False
set_a.issuperset(set_b)             # Is superset: False
set_a >= set_b                      # Is superset (operator): False
set_a.isdisjoint(set_b)             # Is disjoint: False

# Frozen Sets (immutable sets)
my_frozenset = frozenset([1, 2, 3, 4, 5])

# Dictionaries
my_dict = {'a': 1, 'b': 2, 'c': 3}
my_dict['d'] = 4                    # Add new key-value pair: {'a': 1, 'b': 2, 'c': 3, 'd': 4}
my_dict.update({'e': 5, 'f': 6})    # Update with multiple pairs
value = my_dict.get('g')            # Get value (None if key not found)
value = my_dict.get('g', 0)         # Get with default: 0
popped = my_dict.pop('a')           # Remove key and return value: 1
item = my_dict.popitem()            # Remove and return (key, value) pair
my_dict.clear()                     # Remove all items
my_dict = {'a': 1, 'b': 2, 'c': 3}
my_dict.keys()                      # dict_keys(['a', 'b', 'c'])
my_dict.values()                    # dict_values([1, 2, 3])
my_dict.items()                     # dict_items([('a', 1), ('b', 2), ('c', 3)])
'a' in my_dict                      # Check if key exists: True
```

## Sequences and Iteration

```python
# String iteration
for char in "Python":
    print(char)

# List iteration
for item in [1, 2, 3, 4, 5]:
    print(item)

# Dictionary iteration
my_dict = {'a': 1, 'b': 2, 'c': 3}
for key in my_dict:
    print(key, my_dict[key])

for key, value in my_dict.items():
    print(key, value)

# Enumeration
for index, value in enumerate(['a', 'b', 'c']):
    print(index, value)

# Range
for i in range(5):                  # 0, 1, 2, 3, 4
    print(i)

for i in range(1, 6):               # 1, 2, 3, 4, 5
    print(i)

for i in range(1, 10, 2):           # 1, 3, 5, 7, 9
    print(i)

for i in range(10, 0, -1):          # 10, 9, 8, ..., 1
    print(i)

# Zip
for a, b in zip([1, 2, 3], ['a', 'b', 'c']):
    print(a, b)                     # 1 a, 2 b, 3 c

# Sorted iteration
for item in sorted([3, 1, 4, 1, 5, 9]):
    print(item)                     # 1, 1, 3, 4, 5, 9

# Reversed iteration
for item in reversed([1, 2, 3, 4, 5]):
    print(item)                     # 5, 4, 3, 2, 1
```

## Comprehensions

```python
# List comprehension
squares = [x**2 for x in range(10)]  # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

# List comprehension with condition
evens = [x for x in range(10) if x % 2 == 0]  # [0, 2, 4, 6, 8]

# List comprehension with if-else
result = [x if x % 2 == 0 else x*2 for x in range(10)]  # [0, 2, 2, 6, 4, 10, 6, 14, 8, 18]

# Nested list comprehension
matrix = [[i*j for j in range(1, 4)] for i in range(1, 4)]
# [[1, 2, 3], [2, 4, 6], [3, 6, 9]]

# Dictionary comprehension
square_dict = {x: x**2 for x in range(5)}
# {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}

# Dictionary comprehension with condition
even_squares = {x: x**2 for x in range(10) if x % 2 == 0}
# {0: 0, 2: 4, 4: 16, 6: 36, 8: 64}

# Set comprehension
square_set = {x**2 for x in range(5)}
# {0, 1, 4, 9, 16}

# Set comprehension with condition
even_set = {x for x in range(10) if x % 2 == 0}
# {0, 2, 4, 6, 8}
```

## Unpacking and Destructuring

```python
# Tuple unpacking
a, b, c = (1, 2, 3)                 # a=1, b=2, c=3

# List unpacking
a, b, c = [1, 2, 3]                 # a=1, b=2, c=3

# Extended unpacking (Python 3.x)
a, *b, c = [1, 2, 3, 4, 5]          # a=1, b=[2, 3, 4], c=5
*a, b, c = [1, 2, 3, 4, 5]          # a=[1, 2, 3], b=4, c=5
a, b, *c = [1, 2, 3, 4, 5]          # a=1, b=2, c=[3, 4, 5]

# Ignoring values
a, _, c = (1, 2, 3)                 # a=1, c=3, _ is a convention for unused variables

# Swapping variables
a, b = 1, 2
a, b = b, a                         # a=2, b=1

# Unpacking in function calls
args = [3, 6]
range(*args)                        # Equivalent to range(3, 6)

# Unpacking dictionaries in function calls
kwargs = {'start': 1, 'stop': 10, 'step': 2}
range(**kwargs)                     # Equivalent to range(start=1, stop=10, step=2)

# Unpacking in function parameters
def func(a, b, c):
    return a + b + c

func(*[1, 2, 3])                    # 6
func(**{'a': 1, 'b': 2, 'c': 3})    # 6
```

## Selection and Transformation

```python
# Selection with filter
def is_even(x):
    return x % 2 == 0

even_numbers = list(filter(is_even, range(10)))  # [0, 2, 4, 6, 8]
even_numbers = list(filter(lambda x: x % 2 == 0, range(10)))  # [0, 2, 4, 6, 8]

# Selection with list comprehension
even_numbers = [x for x in range(10) if x % 2 == 0]  # [0, 2, 4, 6, 8]

# Selection with list method
numbers = list(range(10))
even_indices = [i for i, x in enumerate(numbers) if x % 2 == 0]  # [0, 2, 4, 6, 8]

# Transformation with map
def square(x):
    return x * x

squares = list(map(square, range(10)))  # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
squares = list(map(lambda x: x * x, range(10)))  # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

# Transformation with list comprehension
squares = [x * x for x in range(10)]  # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

# Combined selection and transformation
even_squares = list(map(square, filter(is_even, range(10))))  # [0, 4, 16, 36, 64]
even_squares = [x * x for x in range(10) if x % 2 == 0]  # [0, 4, 16, 36, 64]
```

## Sorting

```python
# Basic sorting
sorted([3, 1, 4, 1, 5, 9])          # [1, 1, 3, 4, 5, 9]
sorted([3, 1, 4, 1, 5, 9], reverse=True)  # [9, 5, 4, 3, 1, 1]

# Sorting with key function
sorted(['apple', 'banana', 'Cherry'], key=str.lower)  # ['apple', 'banana', 'Cherry']
sorted(['apple', 'banana', 'Cherry'], key=len)        # ['apple', 'banana', 'Cherry']

words = ['apple', 'Banana', 'cherry', 'Date']
sorted(words, key=lambda x: x.lower())  # ['apple', 'Banana', 'cherry', 'Date']

# Sorting dictionaries
people = [
    {'name': 'John', 'age': 30},
    {'name': 'Alice', 'age': 25},
    {'name': 'Bob', 'age': 35}
]
sorted(people, key=lambda x: x['age'])  # Sort by age
sorted(people, key=lambda x: x['name'])  # Sort by name

# Sorting with multiple criteria
students = [
    ('John', 'A', 15),
    ('Jane', 'B', 12),
    ('Dave', 'B', 10),
    ('Alice', 'A', 20)
]
sorted(students, key=lambda x: (x[1], x[2]))  # Sort by grade then score
sorted(students, key=lambda x: (x[1], -x[2]))  # Sort by grade then score (descending)

# In-place sorting
numbers = [3, 1, 4, 1, 5, 9]
numbers.sort()                      # Numbers is now [1, 1, 3, 4, 5, 9]
numbers.sort(reverse=True)          # Numbers is now [9, 5, 4, 3, 1, 1]
```

## Nested Data Structures

```python
# Nested lists
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
matrix[1][2]  # 6

# Iterating over nested lists
for row in matrix:
    for elem in row:
        print(elem, end=' ')  # 1 2 3 4 5 6 7 8 9

# Nested dictionaries
users = {
    'user1': {
        'name': 'John',
        'age': 30,
        'roles': ['admin', 'user']
    },
    'user2': {
        'name': 'Alice',
        'age': 25,
        'roles': ['user']
    }
}
users['user1']['roles'][0]  # 'admin'

# Iterating over nested dictionaries
for user_id, user_info in users.items():
    print(f"User ID: {user_id}")
    print(f"Name: {user_info['name']}")
    print(f"Age: {user_info['age']}")
    print("Roles:")
    for role in user_info['roles']:
        print(f"- {role}")

# List of dictionaries
books = [
    {'title': 'Python Basics', 'author': 'John Smith', 'year': 2020},
    {'title': 'Advanced Python', 'author': 'Jane Doe', 'year': 2021},
    {'title': 'Python Cookbook', 'author': 'John Smith', 'year': 2019}
]

# Filtering nested data
john_books = [book for book in books if book['author'] == 'John Smith']

# Transforming nested data
titles = [book['title'] for book in books]

# Complex data structure example
data = {
    'departments': {
        'engineering': {
            'employees': [
                {'name': 'John', 'position': 'Developer'},
                {'name': 'Alice', 'position': 'Engineer'}
            ],
            'projects': ['Alpha', 'Beta']
        },
        'marketing': {
            'employees': [
                {'name': 'Bob', 'position': 'Manager'},
                {'name': 'Carol', 'position': 'Designer'}
            ],
            'projects': ['Gamma']
        }
    }
}

# Accessing nested elements
data['departments']['engineering']['employees'][0]['name']  # 'John'

# Deep copying nested structures
import copy
deep_copy = copy.deepcopy(data)
```

## PEDAC Problem Solving

```python
# PEDAC steps:
# P - Understand the Problem
# E - Examples and Test Cases
# D - Data Structure
# A - Algorithm
# C - Code

# Example problem: Find all anagrams of a word from a list
def find_anagrams(word, word_list):
    # P: Find all words in word_list that are anagrams of 'word'
    # E: find_anagrams('listen', ['enlist', 'silent', 'inlets', 'banana']) => ['enlist', 'silent', 'inlets']
    # D: Dictionary for character frequency, List for results
    # A:
    #   1. Create a character frequency map for 'word'
    #   2. For each candidate in word_list:
    #      a. Create a character frequency map
    #      b. Compare with the word's map
    #      c. If maps are equal, add candidate to results
    #   3. Return results
    
    # C:
    # Create character frequency map for the target word
    word_chars = {}
    for char in word.lower():
        word_chars[char] = word_chars.get(char, 0) + 1
    
    # Check each candidate
    anagrams = []
    for candidate in word_list:
        if len(candidate) != len(word):
            continue
            
        candidate_chars = {}
        for char in candidate.lower():
            candidate_chars[char] = candidate_chars.get(char, 0) + 1
            
        if candidate_chars == word_chars:
            anagrams.append(candidate)
            
    return anagrams

# Test
find_anagrams('listen', ['enlist', 'silent', 'inlets', 'banana'])  # ['enlist', 'silent', 'inlets']
```

## Debugging with pdb

```python
# Import the debugger
import pdb

# Set a breakpoint
def buggy_function(a, b):
    result = a + b
    pdb.set_trace()  # Debugger will stop here
    return result * 2

# Common pdb commands:
# n (next) - Execute the current line and move to the next one
# s (step) - Step into a function call
# c (continue) - Continue execution until the next breakpoint
# p expression - Print the value of an expression
# pp expression - Pretty-print the value of an expression
# l (list) - Show the current line and context
# w (where) - Show the stack trace
# u (up) - Move up one frame in the stack
# d (down) - Move down one frame in the stack
# b line_number - Set a breakpoint at the line number
# q (quit) - Quit the debugger

# Conditional breakpoint
import pdb; pdb.set_trace() if x > 10 else None

# Post-mortem debugging
try:
    # Some code that might raise an exception
    result = 1 / 0
except Exception:
    import pdb; pdb.post_mortem()
```
