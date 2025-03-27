# PY110: Programming Foundations with Python: Intermediate - Study Guide

## Python Sequences and Collections

### Key Concepts:

1. **Collections Overview**
   - Sequence types (lists, tuples, strings, ranges)
   - Mapping types (dictionaries)
   - Set types (sets, frozensets)
   - Mutable vs. immutable collections
   - Common operations across collection types

2. **Lists and Tuples**
   - Creating, accessing, and modifying lists
   - List methods: append, extend, insert, remove, pop
   - Tuples as immutable sequences
   - Single-element tuples and tuple packing/unpacking
   - When to use lists vs. tuples

3. **Dictionaries and Sets**
   - Dictionary creation and access patterns
   - Dictionary methods: get, update, pop, items
   - Sets for unique collections
   - Set operations: union, intersection, difference
   - Performance characteristics of dictionaries and sets

4. **Iterable Unpacking**
   - Basic unpacking of sequences
   - Extended unpacking with * operator
   - Unpacking in function calls and parameters
   - Multiple assignment and swapping variables
   - Nested unpacking

### Practice Questions:

1. Explain the differences between lists, tuples, sets, and dictionaries, including when to use each.
2. How would you create a list of tuples from two separate lists?
3. Write a function that finds all duplicate values in a list and returns them in a set.
4. Demonstrate how to use unpacking to swap the values of two variables.
5. How would you merge two dictionaries while ensuring values from the second dictionary overwrite those from the first?

## Advanced Collections and Iteration

### Key Concepts:

1. **Iteration Techniques**
   - Iterating over different collection types
   - Using enumerate, zip, and range effectively
   - Working with iterators and iterables
   - Generator expressions and their benefits
   - The iteration protocol in Python

2. **Comprehensions**
   - List comprehensions and their components
   - Set and dictionary comprehensions
   - Nested comprehensions
   - Filtering with comprehensions
   - Comprehensions vs. traditional loops and map/filter

3. **Selection and Transformation**
   - Selecting elements based on criteria
   - Transforming elements during iteration
   - Combining selection and transformation
   - The filter and map functions
   - Functional programming concepts in Python

4. **Sorting**
   - Basic sorting with sorted() and .sort()
   - Custom sort keys and lambda functions
   - Multi-criteria sorting
   - Sorting stability
   - Sorting complex data structures

### Practice Questions:

1. Write a list comprehension that generates a list of tuples containing (number, square, cube) for numbers 1 through 10.
2. Explain how you would use zip() to iterate over multiple sequences simultaneously.
3. Write a function that sorts a list of dictionaries by a specified key.
4. How would you use filter() to remove all negative numbers from a list?
5. Write a comprehension that creates a dictionary mapping words to their lengths from a list of words.

## Nested Data Structures

### Key Concepts:

1. **Working with Nested Collections**
   - Accessing elements in nested structures
   - Modifying nested structures
   - Iterating through nested structures
   - Common patterns for nested data processing
   - Handling nested data of unknown depth

2. **Copying Issues**
   - Shallow vs. deep copying
   - Copy operations on nested structures
   - The copy module
   - Avoiding unintended side effects
   - Immutable vs. mutable nested components

3. **Complex Data Manipulation**
   - Flattening nested structures
   - Building nested structures
   - Transforming between different nested forms
   - Common nested data formats (JSON-like structures)
   - Performance considerations with nested structures

4. **Practical Applications**
   - Representing hierarchical data
   - Working with matrix-like data
   - Nested dictionaries for configuration
   - Tree and graph-like structures
   - Processing data from APIs and files

### Practice Questions:

1. Write a function that flattens a list of lists into a single list.
2. How would you create a deep copy of a nested dictionary?
3. Write a function that counts the total number of elements in a nested list structure.
4. Create a function to find a value in a nested dictionary of arbitrary depth.
5. How would you transform a flat list into a nested dictionary based on specific criteria?

## The PEDAC Problem Solving Process

### Key Concepts:

1. **Problem Understanding**
   - Breaking down problem statements
   - Identifying inputs, outputs, and edge cases
   - Clarifying implicit and explicit requirements
   - Recognizing problem patterns
   - Asking the right questions

2. **Examples and Test Cases**
   - Creating examples for normal cases
   - Identifying and handling edge cases
   - Using examples to validate understanding
   - Building a test suite
   - Testing-driven approach to problem solving

3. **Data Structures**
   - Choosing appropriate data structures
   - Data transformation planning
   - Intermediate representations
   - Performance considerations
   - Memory usage optimization

4. **Algorithm Development**
   - Breaking down problems into steps
   - Pseudocode writing techniques
   - Algorithm efficiency analysis
   - Refining and optimizing algorithms
   - Handling complex control flow

### Practice Questions:

1. Apply the PEDAC process to solve: Write a function that returns all palindromes in a given string.
2. Explain how you would approach the problem of finding the longest substring without repeating characters.
3. What data structure would you choose for implementing a cache with least-recently-used eviction policy?
4. How would you develop an algorithm to determine if two strings are anagrams of each other?
5. Use the PEDAC process to implement a function that calculates the nth Fibonacci number.

## Debugging and Program Organization

### Key Concepts:

1. **Debugging with pdb**
   - Using the Python debugger
   - Setting breakpoints
   - Stepping through code
   - Inspecting variables
   - Conditional debugging

2. **Error Handling Strategies**
   - Identifying common error patterns
   - Using try/except blocks effectively
   - Custom exceptions
   - Error recovery techniques
   - Defensive programming practices

3. **Code Organization**
   - Function and module structure
   - Separation of concerns
   - Pure vs. impure functions
   - Code reusability
   - Maintainability considerations

4. **Testing Approaches**
   - Unit testing basics
   - Test-driven development
   - Edge case testing
   - Performance testing
   - Debugging test failures

### Practice Questions:

1. How would you use pdb to debug a function that sometimes returns incorrect results?
2. Write a function with appropriate error handling for converting a string to a number.
3. How would you refactor a monolithic function into smaller, reusable components?
4. Describe a strategy for testing a function that processes nested collections.
5. How can you determine where a performance bottleneck exists in your Python code?

## Slightly Larger Programs

### Key Concepts:

1. **Program Design**
   - Program structure planning
   - Breaking down features
   - Module organization
   - State management
   - User interaction design

2. **Game Development**
   - Game state representation
   - Turn-based logic
   - Player interaction
   - AI opponent strategies
   - Game loop structure

3. **Project Organization**
   - File structure
   - Configuration management
   - Dependency handling
   - Version control best practices
   - Documentation

4. **Code Quality**
   - Style guidelines (PEP 8)
   - Code reviews
   - Refactoring techniques
   - Technical debt management
   - Performance optimization

### Practice Questions:

1. How would you design a command-line Tic Tac Toe game?
2. What are the key components needed for implementing a card game like Twenty-One?
3. Describe how you would structure a project with multiple related features.
4. How would you implement an AI opponent for a simple game?
5. What strategies would you use to ensure code quality in a team project?

## Exam Preparation Tips

1. **Master Collection Manipulation**
   - Practice with different collection types
   - Work through complex nested structures
   - Implement common algorithms on collections
   - Get comfortable with comprehensions
   - Understand the performance implications of different approaches

2. **Develop Problem-Solving Strategies**
   - Apply PEDAC consistently
   - Break down complex problems
   - Identify patterns in problems
   - Practice working through example problems step-by-step
   - Validate solutions with test cases

3. **Focus on Practical Implementation**
   - Build small programs from scratch
   - Refactor existing code
   - Implement games and utilities
   - Practice debugging real code
   - Work with files and user input

4. **Study Pattern Recognition**
   - Identify common programming patterns
   - Recognize when to use specific data structures
   - Learn standard algorithms for common tasks
   - Practice translating problems into code
   - Develop intuition for optimization opportunities

5. **Review Project Code**
   - Study the Tic Tac Toe implementation
   - Understand the Twenty-One card game code
   - Review other sample programs
   - Implement bonus features for practice
   - Look for patterns across different programs
