# PY130: More Python Foundations - Glossary

## Functions and Callables

**First-Class Function**: A function that can be treated like any other variable - assigned to variables, passed as arguments, returned from functions, or stored in data structures.

**Higher-Order Function**: A function that either takes one or more functions as arguments or returns a function as its result.

**Anonymous Function**: A function defined without a name, typically created using the `lambda` keyword.

**Lambda Function**: A small anonymous function created with the `lambda` keyword that can take any number of arguments but can only have one expression.

**Closure**: A function that remembers the values from the enclosing lexical scope even when executed outside that scope.

**Decorator**: A function that takes another function as an argument, adds some functionality, and returns another function without modifying the source code of the original function.

**Callable**: Any object that can be called like a function (using parentheses), including functions, methods, classes, and objects with a `__call__` method.

**Partial Function**: A function with some of its arguments already fixed, created using `functools.partial`.

**Function Composition**: Combining two or more functions to create a new function.

**Pure Function**: A function that always produces the same output for the same input and has no side effects.

**Side Effect**: A modification of state outside the local environment, such as modifying a global variable, modifying a parameter passed by reference, raising an exception, or performing I/O operations.

## Generators and Iteration

**Iterator**: An object implementing the iterator protocol methods `__iter__` and `__next__`.

**Iterable**: An object capable of returning its members one at a time, implementing the `__iter__` method that returns an iterator.

**Generator**: A special type of iterator created from a function that uses the `yield` statement.

**Generator Expression**: A concise way to create a generator, similar to a list comprehension but with parentheses instead of square brackets.

**yield**: A keyword used in functions to return a value and suspend the function's execution state, creating a generator.

**yield from**: A syntax introduced in Python 3.3 to delegate part of a generator's operations to another generator.

**Lazy Evaluation**: The strategy of delaying the evaluation of an expression until its value is actually needed.

**Iterator Protocol**: The protocol consisting of the `__iter__` and `__next__` methods that objects must implement to be iterators.

**StopIteration**: An exception raised by an iterator when it has no more items to produce.

## Files and I/O

**File Object**: An object that provides a file-oriented API with methods for reading from and writing to files.

**File Mode**: A string indicating how a file should be opened (e.g., 'r' for reading, 'w' for writing, 'a' for appending).

**Text Mode**: A file opening mode that handles the file content as text, performing encoding and decoding.

**Binary Mode**: A file opening mode that handles the file content as bytes, without encoding or decoding.

**Context Manager**: An object that implements the context management protocol (`__enter__` and `__exit__` methods), often used with the `with` statement.

**Buffer**: A temporary storage area for data being read from or written to a file.

**File Position**: The current position within a file, accessed with the `tell()` method and modified with the `seek()` method.

**Stream**: A sequence of data elements made available over time, often used for input/output operations.

**Encoding**: The process of converting characters to bytes when writing to a file (or the specified character encoding).

**Decoding**: The process of converting bytes to characters when reading from a file (or the specified character encoding).

## Arguments and Parameters

**Positional Argument**: An argument passed to a function based on its position in the function call.

**Keyword Argument**: An argument passed to a function using the parameter name.

**Default Parameter**: A parameter that is given a default value if no argument is provided for it.

**Variable-Length Argument List**: A parameter that can accept any number of positional arguments, denoted by an asterisk (`*args`).

**Variable-Length Keyword Argument Dictionary**: A parameter that can accept any number of keyword arguments, denoted by two asterisks (`**kwargs`).

**Positional-Only Parameter**: A parameter that must be passed positionally (not by keyword), indicated by a slash (`/`) in the function definition (Python 3.8+).

**Keyword-Only Parameter**: A parameter that must be passed by keyword (not positionally), indicated by placing it after a `*` in the function definition.

**Parameter Unpacking**: The process of extracting individual values from an iterable or mapping using the `*` and `**` operators in a function call.

## Modules and Packages

**Module**: A file containing Python definitions and statements, which can be imported and used in other Python files.

**Package**: A directory containing multiple Python modules, typically with an `__init__.py` file.

**Import**: The process of loading a module and making its contents available in the current namespace.

**Absolute Import**: An import that specifies the full path from the project's root directory.

**Relative Import**: An import that specifies the path relative to the current module's location.

**Namespace Package**: A package split across multiple directories (without `__init__.py` files) introduced in Python 3.3.

**Virtual Environment**: An isolated Python environment that allows packages to be installed locally for a specific project.

**pip**: The package installer for Python, used to install packages from the Python Package Index (PyPI).

**setup.py**: A file used to configure a Python package for distribution.

**Wheel**: A built package format that can be installed without requiring the build step.

**Egg**: An older format for Python distributions, largely replaced by wheels.

## Testing and Quality Assurance

**Unit Test**: A test that verifies the behavior of a specific unit of code, typically a function or method.

**Test Case**: A set of test inputs, execution conditions, and expected results.

**Test Suite**: A collection of test cases.

**Assertion**: A statement that verifies a condition is true and raises an exception if it's false.

**Mock**: An object that simulates the behavior of a real object in a controlled way.

**Patch**: A technique for temporarily replacing an object or function with a mock during testing.

**Fixture**: A resource or state that is set up before a test and cleaned up afterward.

**Test-Driven Development (TDD)**: A development process where tests are written before the code that needs to be tested.

**Code Coverage**: A measure of how much of the code is executed during testing.

**unittest**: Python's built-in testing framework.

**pytest**: A popular third-party testing framework for Python.

## Advanced Concepts

**Garbage Collection**: The process of automatically freeing memory that is no longer in use.

**Reference Counting**: A technique used by Python's garbage collector to track how many references point to an object.

**Cyclic Reference**: A reference cycle where objects refer to each other, potentially causing memory leaks.

**Weakref**: A reference to an object that doesn't increase its reference count, used to avoid cyclic references.

**Descriptor**: An object that customizes attribute access on classes and instances.

**Metaclass**: A class whose instances are classes, allowing customization of class creation.

**Abstract Base Class (ABC)**: A class that cannot be instantiated and serves as a blueprint for other classes.

**Context Manager Protocol**: The protocol consisting of the `__enter__` and `__exit__` methods that objects must implement to be used with the `with` statement.

**Duck Typing**: A programming style where type checking is based on an object's behavior (methods and properties) rather than its class or type.

**Monkey Patching**: The practice of modifying classes or modules at runtime.

## Functional Programming Concepts

**Immutable Data**: Data that cannot be changed after creation.

**Mutable Data**: Data that can be changed after creation.

**Recursion**: A technique where a function calls itself to solve a problem.

**Map/Filter/Reduce**: Common higher-order functions in functional programming.

**List/Dictionary/Set Comprehension**: Concise syntax for creating lists, dictionaries, or sets based on existing iterables.

**Functional Programming**: A programming paradigm that treats computation as the evaluation of mathematical functions and avoids changing state and mutable data.

**Chain of Functions**: A sequence of function calls where the output of one function becomes the input to the next.
