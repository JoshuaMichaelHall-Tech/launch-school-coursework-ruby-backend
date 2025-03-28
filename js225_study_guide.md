# JS225: Object Oriented JavaScript - Study Guide

## Objects

### Key Concepts:

1. **Object Fundamentals**
   - Creating objects with object literals
   - Properties and methods
   - Accessing object properties (dot notation vs. bracket notation)
   - Mutability of objects

2. **Object Methods**
   - Defining methods in objects
   - Method context and `this` value
   - Method extraction and context loss
   - Method borrowing

3. **Object Factories**
   - Creating objects with factory functions
   - Benefits and limitations of the factory pattern
   - Private data with closures
   - Methods sharing vs. duplication

4. **Object Orientation**
   - Principles of object-oriented programming
   - Encapsulation and information hiding
   - Polymorphism through duck typing
   - Creating well-designed object interfaces

### Practice Questions:

1. What is the difference between accessing a property with dot notation versus bracket notation?
2. How can you create private data in objects using closures?
3. What are the advantages and disadvantages of the factory function pattern?
4. How would you implement object composition in JavaScript?
5. Describe how encapsulation works in JavaScript objects.

## Function Contexts and Objects

### Key Concepts:

1. **The Global Object**
   - Global execution context
   - Global variables as properties of the global object
   - Implicit global variables
   - Strict mode effects on the global object

2. **Execution Contexts**
   - Function execution context determination
   - Implicit context rules
   - Explicit context setting with call, apply, and bind
   - Arrow functions and lexical `this`

3. **Hard Binding**
   - Permanently setting a function's execution context
   - Using bind to create new functions with fixed context
   - Preventing context loss through binding
   - Partial function application with bind

4. **Context Loss**
   - Common scenarios for losing context
   - Method extraction and standalone invocation
   - Function as argument losing context
   - Nested functions in methods
   - Solutions to context loss problems

### Practice Questions:

1. Explain how the value of `this` is determined in different function invocation patterns.
2. What is the difference between call, apply, and bind methods?
3. Describe three different ways to solve the context loss problem when passing methods as callbacks.
4. How do arrow functions differ from regular functions with respect to `this`?
5. Explain how the execution context changes when a method is extracted from an object.

## Closures and Function Scope

### Key Concepts:

1. **Closures and Functions**
   - Lexical scoping and variable access
   - Creating and using closures
   - Closure use cases and applications
   - Memory considerations with closures

2. **Higher-Order Functions**
   - Functions that accept function arguments
   - Functions that return functions
   - Function decorators and enhancers
   - Applications of higher-order functions

3. **Private Data**
   - Encapsulating data with closures
   - Creating private variables and methods
   - Information hiding patterns
   - Data access control through closures

4. **Garbage Collection**
   - How JavaScript manages memory
   - Closure impact on garbage collection
   - Memory leaks with closures
   - Best practices for memory management

5. **Partial Function Application**
   - Creating functions with pre-set arguments
   - Implementing partial application
   - Differentiating partial application from currying
   - Use cases for partial application

6. **Immediately Invoked Function Expressions (IIFEs)**
   - Creating and executing IIFEs
   - Creating private scopes with IIFEs
   - Module pattern using IIFEs
   - Benefits of IIFEs in application design

### Practice Questions:

1. Explain how closures work in JavaScript and provide an example.
2. How would you use closures to create private data in an object?
3. Implement a simple function decorating system using higher-order functions.
4. Write a partial application function that works with any function and any number of arguments.
5. Create a module pattern using an IIFE that exposes some functions but keeps others private.

## Object Creation Patterns

### Key Concepts:

1. **Factory Functions**
   - Creating objects with factory functions
   - Advantages and disadvantages of factories
   - Private state with closures in factories
   - Method sharing strategies with factories

2. **Constructor Functions**
   - Creating objects with constructors and `new`
   - Constructor function conventions
   - `this` in constructor functions
   - Problems with forgetting `new`

3. **Prototypes and Inheritance**
   - Object prototype property
   - Prototype chain lookup
   - Inheriting properties and methods
   - Prototype delegation behavior

4. **Constructor-Prototype Pattern**
   - Combining constructors with prototypes
   - Instance properties vs. prototype properties
   - Method efficiency with prototypes
   - Building inheritance hierarchies

5. **Pseudo-classical vs. OLOO Patterns**
   - Constructor-prototype (pseudo-classical) approach
   - Objects linking to other objects (OLOO) approach
   - Differences and trade-offs between patterns
   - When to use each pattern

6. **Built-in Object Methods**
   - `Object.create` for prototypal inheritance
   - `Object.assign` for property copying
   - `Object.getPrototypeOf` and `Object.setPrototypeOf`
   - Property descriptor methods

### Practice Questions:

1. Compare and contrast factory functions and constructor functions. When would you use each?
2. Explain how the prototype chain works in JavaScript.
3. Implement inheritance using both the pseudo-classical and OLOO patterns. What are the differences?
4. How would you create a "subclass" using constructor functions?
5. Describe the benefits of putting methods on the prototype rather than in the constructor function.

## Exam Preparation Tips

1. **Understanding Context**
   - Practice tracing `this` in different scenarios
   - Implement solutions for context loss
   - Create examples with methods, constructors, and callbacks
   - Identify when to use bind, call, or apply

2. **Object Patterns**
   - Implement each object creation pattern
   - Convert between different patterns
   - Build inheritance hierarchies
   - Practice creating modules and namespaces

3. **Closures and Scope**
   - Create functions that use closures
   - Implement private data patterns
   - Write higher-order functions
   - Use IIFEs for practical applications

4. **Prototype Chain**
   - Draw diagrams of prototype chains
   - Trace property lookup through the prototype chain
   - Create custom inheritance structures
   - Practice using built-in Object methods

5. **Common Gotchas**
   - Forgetting `new` with constructor functions
   - Method extraction causing context loss
   - Misunderstanding prototype vs. own properties
   - Closure-related memory issues
