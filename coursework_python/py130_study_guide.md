# PY130: More Python Foundations - Study Guide

## 1. First-Class and Higher-Order Functions

### First-Class Functions
- Functions in Python are first-class objects, meaning they can be:
  - Assigned to variables
  - Passed as arguments to other functions
  - Returned from other functions
  - Stored in data structures like lists, dictionaries, etc.

### Higher-Order Functions
- Functions that either:
  - Take one or more functions as arguments, or
  - Return a function as their result
- Examples from the standard library:
  - `map()`: Applies a function to each item in an iterable
  - `filter()`: Filters elements from an iterable based on a function
  - `sorted()`: Sorts an iterable with an optional key function

### Lambda Functions
- Anonymous functions created with the `lambda` keyword
- Syntax: `lambda parameters: expression`
- Limited to a single expression
- Useful for short functions passed as arguments

### Functional Tools
- The `functools` module provides tools for functional programming:
  - `functools.reduce()`: Apply a function cumulatively to items of an iterable
  - `functools.partial()`: Create a new function with some arguments fixed
  - `functools.lru_cache()`: Cache function results for performance
  - `functools.wraps()`: Preserve metadata when decorating functions

## 2. Closures and Decorators

### Closures
- A function that remembers values from its enclosing lexical scope even when executed outside that scope
- Requirements for a closure:
  - A nested function
  - The nested function must refer to a value defined in the enclosing function
  - The enclosing function must return the nested function

### Decorators
- A function that takes another function as an argument, adds functionality, and returns a new function
- Implemented using the `@decorator_name` syntax above function definitions
- Decorators can be chained (multiple decorators on a single function)
- Can be implemented with or without arguments

### Decorator Best Practices
- Use `functools.wraps` to preserve the original function's metadata
- Handle arbitrary positional and keyword arguments with `*args` and `**kwargs`
- Consider providing an option to disable the decorator

## 3. Generators and Iteration

### Iterables and Iterators
- **Iterable**: An object capable of returning its elements one at a time (implements `__iter__`)
- **Iterator**: An object representing a stream of data (implements `__iter__` and `__next__`)
- The iterator protocol:
  - `__iter__`: Returns the iterator object itself
  - `__next__`: Returns the next item in the sequence or raises `StopIteration` when exhausted

### Generator Functions
- Functions that use `yield` to return values one at a time
- Maintain their state between calls
- Lazy evaluation (compute values only when needed)
- Memory efficient for large datasets

### Generator Expressions
- Concise way to create generators using a syntax similar to list comprehensions
- Syntax: `(expression for item in iterable if condition)`
- Evaluated lazily, unlike list comprehensions

### Advanced Generator Features
- `yield from`: Delegate part of a generator's operations to another generator
- Sending values to a generator using `generator.send(value)`
- Closing a generator using `generator.close()`
- Throwing exceptions into a generator using `generator.throw(exception)`

## 4. Files and I/O

### File Operations
- Opening files: `open(file_path, mode)`
- Common modes:
  - `'r'`: Read (default)
  - `'w'`: Write (overwrites existing content)
  - `'a'`: Append
  - `'b'`: Binary mode (used with other modes)
  - `'t'`: Text mode (default, used with other modes)
- Reading from files:
  - `read()`: Read entire file or specified number of bytes
  - `readline()`: Read a single line
  - `readlines()`: Read all lines into a list
- Writing to files:
  - `write()`: Write string to file
  - `writelines()`: Write a list of strings to file

### Context Managers
- The `with` statement for automatic resource management
- Ensures proper cleanup of resources (like file closure)
- The context manager protocol:
  - `__enter__`: Set up the context and return a value
  - `__exit__`: Clean up resources, handle exceptions

### Working with Different File Types
- Text files (default)
- Binary files (with `'b'` mode)
- CSV files (using the `csv` module)
- JSON files (using the `json` module)
- Handling file paths with the `pathlib` module

## 5. Advanced Function Parameters

### Different Parameter Types
- Positional parameters
- Keyword parameters
- Default parameters
- Variable-length positional parameters (`*args`)
- Variable-length keyword parameters (`**kwargs`)
- Positional-only parameters (with `/` separator, Python 3.8+)
- Keyword-only parameters (with `*` separator)

### Parameter Unpacking
- Using `*` to unpack an iterable into positional arguments
- Using `**` to unpack a mapping into keyword arguments
- Combining different parameter types in function definitions
- Best practices for parameter ordering

## 6. Modules and Packages

### Module Basics
- A module is a file containing Python definitions and statements
- Importing modules:
  - `import module_name`
  - `from module_name import item`
  - `from module_name import item as alias`
  - `import module_name as alias`

### Package Structure
- A package is a directory containing multiple modules
- The `__init__.py` file (required in Python 2.x, optional but recommended in Python 3.x)
- Subpackages and nested package structures
- Namespace packages (Python 3.3+)

### Import System
- Absolute imports vs. relative imports
- Circular imports and how to avoid them
- Import resolution and the module search path (`sys.path`)
- Controlling imported names with `__all__`

### Creating Distributable Packages
- Setting up a proper package structure
- Creating a `setup.py` file
- Building and distributing packages
- Publishing to PyPI (Python Package Index)

## 7. Testing with unittest

### unittest Framework Basics
- Creating test cases by subclassing `unittest.TestCase`
- Naming conventions for test methods (must start with `test_`)
- Running tests from the command line
- Organizing tests into suites

### Common Assertions
- `assertEqual`, `assertNotEqual`: Check equality
- `assertTrue`, `assertFalse`: Check boolean values
- `assertIs`, `assertIsNot`: Check object identity
- `assertIn`, `assertNotIn`: Check membership
- `assertRaises`: Check if code raises an exception
- `assertAlmostEqual`: Check approximate equality for floats

### Test Fixtures
- `setUp`: Method called before each test
- `tearDown`: Method called after each test
- `setUpClass`, `tearDownClass`: Class-level setup and teardown
- `setUpModule`, `tearDownModule`: Module-level setup and teardown

### Test Organization
- Test discovery
- Skipping tests with `@unittest.skip` decorators
- Expected failures with `@unittest.expectedFailure`
- Subtest contexts for running variations of a test

## 8. Mocking in Tests

### Mocking Basics
- The `unittest.mock` module
- Creating mock objects with `Mock` and `MagicMock`
- Configuring mocks with `return_value` and `side_effect`
- Asserting how mocks were called

### Patching
- Temporarily replacing objects during tests
- Using the `patch` decorator or context manager
- Patching objects in different scopes
- Auto-speccing mocks to match the API of the replaced object

### Common Mocking Patterns
- Mocking function return values
- Mocking exceptions
- Mocking object attributes
- Mocking context managers
- Mocking iterators and generators

## 9. Code Coverage

### Measuring Code Coverage
- Using the `coverage.py` tool
- Running tests with coverage
- Interpreting coverage reports
- Identifying untested code

### Coverage Best Practices
- Setting coverage targets
- Excluding code from coverage analysis
- Writing effective tests to increase coverage
- Avoiding coverage-driven development

## 10. Side Effects and Pure Functions

### Pure Functions
- Functions that always return the same output for the same input
- No side effects or state changes
- Benefits of pure functions:
  - Easier to test
  - Easier to reason about
  - Suitable for parallelization
  - Cacheable

### Side Effects
- Modifications outside the function's local environment
- Common side effects:
  - Modifying global variables
  - Modifying mutable arguments
  - I/O operations (file, network, etc.)
  - Raising exceptions
  - Calls to other functions with side effects

### Managing Side Effects
- Isolating side effects
- Dependency injection
- Using pure functions where possible
- Testing strategies for functions with side effects

## 11. Garbage Collection

### Python's Memory Management
- Reference counting
- Automatic garbage collection
- The `gc` module
- Deterministic vs. non-deterministic cleanup

### Common Memory Issues
- Circular references
- Memory leaks
- How to identify and fix memory issues
- Using weak references (`weakref` module)

## 12. Advanced Concepts

### Callables
- Objects that can be called like functions
- Implementing `__call__` in custom classes
- Determining if an object is callable with `callable()`

### Descriptors
- Objects that customize attribute access
- Implementing descriptors using `__get__`, `__set__`, and `__delete__`
- Property descriptors with `@property`

### Context Manager Protocol
- Implementing custom context managers
- The `contextlib` module
- Using `@contextmanager` decorator for simplified context managers

## 13. Study Strategies

### Practical Exercises
1. Implement higher-order functions from scratch
2. Create decorators for various purposes
3. Build custom iterators and generators
4. Write and run unit tests for your code
5. Create a small distributable package

### Key Concepts to Master
1. First-class functions and their applications
2. Creating and using closures
3. Implementing effective decorators
4. Working with generators and the iterator protocol
5. File I/O best practices
6. Testing strategies and mocking
7. Pure functions vs. functions with side effects

### Common Pitfalls
1. Mutable default arguments
2. Late binding closures
3. Not preserving function metadata in decorators
4. Inefficient file operations
5. Circular imports
6. Unreliable test expectations
7. Memory leaks from circular references

### Review Questions
1. How do you create a decorator that takes arguments?
2. What is the difference between an iterable and an iterator?
3. How does a generator function differ from a regular function?
4. What are the benefits of using the `with` statement when working with files?
5. How do you test a function that has side effects?
6. What techniques can be used to avoid circular imports?
7. How do you create and publish a Python package?
8. What are the best practices for writing effective unit tests?
