# PY120: Object-Oriented Programming with Python - Study Guide

## 1. Core OOP Concepts

### Classes and Objects
- **Classes** are blueprints for creating objects
- **Objects** are instances of classes with attributes (state) and methods (behavior)
- Creating a class:
  ```python
  class MyClass:
      def __init__(self, param):  # Constructor
          self.param = param      # Instance variable
      
      def my_method(self):        # Instance method
          return self.param
  ```
- Instantiating an object:
  ```python
  my_object = MyClass("value")
  ```

### Types of Methods and Variables
- **Instance methods**: Operate on specific instances (use `self`)
- **Class methods**: Operate on the class itself (use `@classmethod` decorator and `cls` parameter)
- **Static methods**: Don't use instance or class state (use `@staticmethod` decorator)
- **Instance variables**: Defined within methods using `self.variable_name`
- **Class variables**: Defined directly within the class body

### Inheritance
- Mechanism for code reuse and relationship modeling
- Child classes inherit attributes and methods from parent classes
- Creating a subclass:
  ```python
  class ChildClass(ParentClass):
      def __init__(self, parent_param, child_param):
          super().__init__(parent_param)  # Call parent constructor
          self.child_param = child_param
  ```
- Method Overriding: Redefining methods from parent classes in child classes
- `super()`: Function to call methods from parent classes

### Polymorphism
- Ability for objects of different classes to be treated as objects of a common superclass
- Achieved through inheritance and method overriding
- Duck typing: "If it walks like a duck and quacks like a duck, then it's a duck"
  - Focus on what an object can do rather than what it is

### Encapsulation
- Bundling data and methods that operate on that data within a single unit (class)
- Information hiding using naming conventions:
  - `_variable`: Protected attribute (convention only)
  - `__variable`: Private attribute (name mangling to `_ClassName__variable`)
- Properties:
  ```python
  @property
  def attribute(self):
      return self._attribute
      
  @attribute.setter
  def attribute(self, value):
      # Validation logic here
      self._attribute = value
  ```

### Mix-ins
- Classes that provide methods to other classes without being their parent
- Used to share behavior without full inheritance
- Multiple inheritance: A class can inherit from multiple parent classes
- Method Resolution Order (MRO): The order in which Python searches for methods

## 2. Advanced OOP Concepts

### Special Methods (Dunder Methods)
- Methods with double underscores that provide special functionality
- Common special methods:
  - `__init__(self, ...)`: Constructor
  - `__str__(self)`: String representation for users
  - `__repr__(self)`: String representation for developers
  - `__eq__(self, other)`: Equality comparison
  - `__len__(self)`: Length
  - `__call__(self, ...)`: Make object callable
  - `__getitem__(self, key)`: Access with `obj[key]`
  - `__setitem__(self, key, value)`: Set with `obj[key] = value`

### Operator Overloading
- Customizing operators for user-defined classes
- Common operator methods:
  - `__add__(self, other)`: `+` operator
  - `__sub__(self, other)`: `-` operator
  - `__mul__(self, other)`: `*` operator
  - `__truediv__(self, other)`: `/` operator
  - `__lt__(self, other)`, `__gt__(self, other)`: `<`, `>` operators

### Properties
- Method-like attributes that compute their values when accessed
- Enable validation, computed attributes, and custom getters/setters
- Defined using decorators:
  ```python
  @property  # Getter
  def attribute(self):
      return self._attribute
      
  @attribute.setter  # Setter
  def attribute(self, value):
      if not isinstance(value, int):
          raise TypeError("Must be an integer")
      self._attribute = value
  ```

### Context Managers
- Objects that define `__enter__` and `__exit__` methods
- Used with the `with` statement for resource management
- Ensure proper cleanup of resources (like closing files)

### Exception Handling
- Classes used to represent and handle errors
- Custom exceptions inherit from built-in exception classes
- Try/except/finally blocks for handling exceptions
- The `with` statement for automatic exception handling

## 3. OOP Design Principles

### Collaborators
- Objects that are stored as state within another object
- Help define an object's state and behavior
- Example: A `Library` class might have `Book` objects as collaborators

### CRC Cards
- Class-Responsibility-Collaborator: Design tool for planning object-oriented systems
- Identify:
  - **Class**: What is it?
  - **Responsibilities**: What does it know and do?
  - **Collaborators**: What other classes does it work with?

### Design Principles
- **Single Responsibility Principle**: A class should have only one reason to change
- **Open/Closed Principle**: Open for extension but closed for modification
- **Liskov Substitution Principle**: Subtypes must be substitutable for their base types
- **Interface Segregation Principle**: Many specific interfaces are better than one general interface
- **Dependency Inversion Principle**: Depend on abstractions, not on concrete implementations
- **Law of Demeter**: Only talk to your immediate friends (limit object interactions)

### Composition vs Inheritance
- **Inheritance**: "is-a" relationship
- **Composition**: "has-a" relationship
- Prefer composition over inheritance when possible

### Coupling and Cohesion
- **Coupling**: Degree of interdependence between classes (lower is better)
- **Cohesion**: Degree to which elements within a class belong together (higher is better)

## 4. Python-Specific OOP Considerations

### Duck Typing
- Focus on what an object can do (its methods and attributes) rather than its type
- "If it walks like a duck and quacks like a duck, then it's a duck"
- Enables polymorphism without inheritance

### Type Checking
- `isinstance(obj, class)`: Check if object is an instance of a class or subclass
- `issubclass(cls, class)`: Check if a class is a subclass of another class
- `type(obj)`: Get the exact type of an object (not including inheritance)

### Abstract Base Classes
- From the `abc` module
- Define interfaces that derived classes must implement
- Use `@abstractmethod` decorator to declare abstract methods

### Method Resolution Order (MRO)
- Order in which Python searches for methods in a hierarchy of classes
- Access with `ClassName.__mro__`
- Affected by multiple inheritance
- C3 linearization algorithm determines the order

### Dataclasses (Python 3.7+)
- Simplified class creation for data storage
- Automatically generates special methods like `__init__` and `__repr__`
- Used with `@dataclass` decorator

## 5. Common Design Patterns

### Singleton
- Ensures a class has only one instance
- Provides a global point of access to that instance

### Factory
- Creates objects without specifying the exact class
- Subclasses can alter the type of objects created

### Observer
- Defines a one-to-many dependency between objects
- When one object changes state, all its dependents are notified

### Strategy
- Defines a family of algorithms, encapsulates each one, and makes them interchangeable
- Lets the algorithm vary independently from clients that use it

### Adapter
- Converts the interface of a class into another interface clients expect
- Makes classes work together that couldn't otherwise

## 6. Testing OOP Code

### Unit Testing
- Test individual components in isolation
- For classes, test methods and behaviors
- Use the `unittest` module

### Test Fixtures
- Set up test environment before tests
- Clean up after tests
- Use `setUp` and `tearDown` methods in `unittest.TestCase`

### Mocking
- Replace real objects with mock objects
- Test components in isolation
- Use the `unittest.mock` module

## 7. Practical Implementation Tips

### When to Use Classes vs Functions
- Use classes for:
  - Representing real-world objects or concepts
  - Maintaining state
  - Grouping related behavior
- Use functions for:
  - Simple, stateless operations
  - Utility operations

### Debugging OOP Code
- Follow object relationships
- Inspect state at various points
- Check method resolution order for unexpected behavior

### Code Organization
- Keep classes focused and cohesive
- Group related classes in modules
- Use packages for larger applications

### Documentation
- Document class purpose, responsibilities, and interfaces
- Use docstrings for classes and methods
- Example:
  ```python
  class MyClass:
      """
      This class represents a widget.
      
      Attributes:
          name (str): The widget's name
          
      Methods:
          process(): Process the widget
      """
  ```

## 8. Key Exam Topics

1. Understanding and implementing classes, instance methods, and class methods
2. Proper use of `self` and `cls` parameters
3. Implementing inheritance and method overriding
4. Using super() correctly
5. Implementing encapsulation with properties
6. Creating and using mix-ins
7. Customizing classes with special methods
8. Implementing polymorphism
9. Creating collaborator objects
10. Identifying and fixing common OOP design issues
11. Understanding object equality and comparison
12. Implementing custom exceptions

## 9. Practice Strategies

1. Implement the same program procedurally and with OOP, compare the differences
2. Refactor existing code to use OOP principles
3. Identify classes, responsibilities, and collaborators in real-world scenarios
4. Practice creating class hierarchies for various domains
5. Implement multiple design patterns for the same problem
6. Create and test comprehensive class interfaces
7. Review and critique existing OOP code

## 10. Exam Preparation Tips

1. Review the core OOP concepts thoroughly
2. Understand Python's specific implementation of OOP
3. Practice implementing the various OOP concepts from scratch
4. Complete all practice problems and exercises
5. Be able to explain OOP concepts in your own words
6. Identify OOP principles in existing code
7. Review common OOP design patterns and when to use them
