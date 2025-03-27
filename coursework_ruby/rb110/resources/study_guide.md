# RB110: Programming Foundations with Ruby: Intermediate - Study Guide

## Major Focus Areas

### 1. Collection Processing
- **Iteration**: Using loops and Enumerable methods to process collections
- **Selection**: Filtering collections based on criteria
- **Transformation**: Creating new collections by changing elements
- **Core Methods**: `each`, `map`, `select`, and their proper usage
- **Implementation**: Using both basic loops and Enumerable methods

### 2. Nested Collections
- **Access Patterns**: Retrieving and updating values in complex structures
- **Iteration Techniques**: Processing multi-level collections
- **Mental Models**: Visualizing complex data structures
- **Practical Uses**: Working with real-world nested data

### 3. PEDAC Problem-Solving
- **Problem**: Understanding the problem statement
- **Examples**: Using test cases to clarify requirements
- **Data Structure**: Choosing appropriate structures
- **Algorithm**: Breaking down the solution steps
- **Code**: Implementing the algorithm

### 4. Ruby Enumerable Methods
- **Return Values**: Understanding what each method returns
- **Block Return Values**: How they influence collection method behavior
- **Common Patterns**: Recognizing when to use specific methods
- **Method Combinations**: Chaining methods effectively

### 5. Sorting
- **Comparison**: Using the spaceship operator (`<=>`)
- **Custom Sorting**: Creating specific ordering with blocks
- **Sort Stability**: Understanding when order is preserved
- **Performance Considerations**: Efficiency of different sort approaches

## Key Concepts

### Method Return Values
- Each collection method has a specific return value behavior
- `each`: Returns the original collection
- `map`: Returns a new collection with transformed elements
- `select`: Returns a new collection of filtered elements
- `sort`: Returns a new, sorted collection

### Block Return Values
- The return value of a block affects the behavior of the method it's passed to
- For `select`, the truthiness of the block's return value determines selection
- For `map`, the block's return value becomes an element in the new collection
- For `sort` with a block, the return value must be -1, 0, or 1

### Shallow vs. Deep Copy
- Shallow copy (`dup`, `clone`) only copies the top level of a collection
- Nested objects are shared between the original and the copy
- No built-in deep copy method in Ruby
- Implementing custom deep copy for nested structures

### Method Chaining
- Combining method calls for conciseness and readability
- Understanding the return value of each method in the chain
- Common patterns: `map.select`, `select.map`, `select.sort`
- Debugging problems in method chains

### Debugging Complex Collections
- Visualizing nested structures with `p` and `pp`
- Breaking down complex operations into smaller steps
- Using temporary variables to track intermediate results
- Common bugs in collection processing

## Application Techniques

### Implementing Algorithms
- Use both basic loops and Enumerable methods
- Start with the simplest solution, then refactor for efficiency
- Handle edge cases explicitly
- Test with simple inputs first

### Working with Nested Collections
- Access nested elements with multiple brackets: `arr[0][1]`
- Use multiple block parameters when appropriate
- Build nested structures incrementally
- Test access patterns before implementing complex operations

### Mental Models
- Arrays as ordered, integer-indexed collections
- Hashes as key-value pairs with arbitrary keys
- Blocks as reusable code chunks
- Collections as composite data structures

### Procedural vs. Functional Approaches
- Procedural: Using basic loops, mutating collections
- Functional: Using Enumerable methods, creating new collections
- Trade-offs between readability and performance
- When to choose each approach

## Practice Strategies

- Solve problems from multiple angles
- Implement solutions with basic loops first, then refactor using Enumerable methods
- Work with increasingly complex nested structures
- Focus on understanding the return values of methods and blocks
- Study the official Ruby documentation for Enumerable and Array
