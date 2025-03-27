# RB120: Object-Oriented Programming - Study Guide

## Critical OOP Concepts

### 1. Classes and Objects
- Classes as blueprints for creating objects
- Objects as instances of classes with state and behavior
- The relationship between classes and objects
- Creating and using objects effectively
- Instantiation with the `new` method and `initialize`

### 2. State and Behavior
- Instance variables (`@name`) to track object state
- Instance methods to define object behavior
- The relationship between state and behavior
- Maintaining encapsulation while providing access
- Using accessors (`attr_*` methods) appropriately

### 3. Inheritance Hierarchies
- Class inheritance using the `<` operator
- When and how to use inheritance effectively
- Method overriding and customizing behavior
- Using `super` to leverage parent methods
- Understanding the limitations of single inheritance

### 4. Modules and Mixins
- Creating modules for reusable behavior
- Using `include` to mix in behavior
- Comparing inheritance and composition
- Namespacing with modules
- Multiple inheritance through mixins

### 5. Encapsulation
- Hiding implementation details with private methods
- Exposing interfaces with public methods
- Protected methods and their use cases
- Managing access to object state
- Creating maintainable, well-encapsulated code

### 6. Polymorphism
- Duck typing: focusing on behavior, not class
- Inheritance-based polymorphism
- Interface-based polymorphism through modules
- Implementing polymorphic methods
- Benefits in design flexibility

## In-Depth Topics

### Method Lookup Path
- Order of ancestors when searching for methods
- How Ruby traverses the inheritance hierarchy
- The impact of including multiple modules
- Using `ancestors` method to see the lookup path
- Resolving method conflicts in the path

### Self
- Different contexts for `self` (class vs. instance methods)
- Using `self` for setter methods
- `self` in method definitions vs. method invocations
- Class method definitions with `self`
- Common pitfalls with `self`

### Variable Scope
- Instance variables and their accessibility
- Class variables (`@@variable`) and inheritance
- Local variables within methods
- Constants and their scope
- The relationship between inheritance and variable scope

### Collaborator Objects
- Objects as state within other objects
- Modeling relationships between objects
- Designing effective collaboration
- Managing collaborator lifecycles
- Testing collaborator relationships

### Method Access Control
- Public methods as the interface
- Private methods for internal implementation
- Protected methods for same-class access
- When to use each access level
- Testing with different access levels

## Study Recommendations

### 1. Diagram Class Relationships
- Draw class hierarchies with inheritance arrows
- Map out method lookup paths
- Visualize object collaboration
- Create CRC (Class-Responsibility-Collaboration) cards
- Design patterns and their implementation

### 2. Practice Multiple OOP Approaches
- Solve the same problem with inheritance vs. composition
- Experiment with different levels of encapsulation
- Test various polymorphic implementations
- Compare procedural and object-oriented solutions
- Refactor existing code to improve design

### 3. Focus on Design Principles
- Single Responsibility Principle
- Open/Closed Principle
- Dependency management
- Avoiding tight coupling
- Creating flexible, maintainable systems

### 4. Master OOP Mechanics
- Understanding object instantiation
- Method dispatch and lookup
- Object state management
- Effective use of `super`
- Proper implementation of custom equality

### 5. Build Complete OO Programs
- Design class structures for larger problems
- Implement solutions from scratch
- Test and debug OOP code
- Refactor for improved design
- Document design decisions and trade-offs
