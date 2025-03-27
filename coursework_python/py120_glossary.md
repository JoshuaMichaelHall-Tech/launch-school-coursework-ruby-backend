# PY120: Object-Oriented Programming with Python - Glossary

## Core OOP Concepts

**Class**: A blueprint for creating objects that defines attributes and methods objects of that type will have.

**Object**: An instance of a class, representing a specific entity with its own state and behavior.

**Instantiation**: The process of creating an object from a class.

**Constructor**: A special method (`__init__` in Python) that initializes a newly created object.

**Instance Variable**: A variable that belongs to an individual object instance (defined with `self.variable_name`).

**Class Variable**: A variable that belongs to the class itself and is shared among all instances (defined at the class level).

**Method**: A function defined within a class that defines the behavior of objects.

**Instance Method**: A method that operates on an instance of a class and has access to the instance's attributes.

**Class Method**: A method that belongs to the class rather than instances, defined with the `@classmethod` decorator, and takes `cls` as its first parameter.

**Static Method**: A method that belongs to a class but doesn't access class or instance attributes, defined with the `@staticmethod` decorator.

**Inheritance**: A mechanism where a class (subclass) can inherit attributes and methods from another class (superclass).

**Superclass/Parent Class**: A class from which other classes inherit.

**Subclass/Child Class**: A class that inherits from another class.

**Polymorphism**: The ability for different objects to respond to the same method call in ways specific to their type or class.

**Encapsulation**: The bundling of data and methods that operate on that data within a single unit (class), with restricted access to some components.

**Abstraction**: Hiding the complex implementation details and showing only the necessary features of an object.

**Mix-in**: A class that provides specific functionality but is not meant to be instantiated on its own.

## Python-Specific OOP Terms

**Special Methods/Dunder Methods**: Methods with double underscores (e.g., `__init__`, `__str__`) that provide special functionality in Python.

**Property**: A method decorated with `@property` that allows access to a method as if it were an attribute.

**Getter**: A method that retrieves an attribute value, often implemented as a property.

**Setter**: A method that sets an attribute value, implemented with the `@property_name.setter` decorator.

**Descriptor**: An object that defines how attribute access is handled.

**Method Resolution Order (MRO)**: The order in which Python looks for methods in a hierarchy of classes.

**Multiple Inheritance**: When a class inherits from more than one parent class.

**Self**: The first parameter in an instance method, referring to the instance itself.

**Super()**: A function to call methods from a parent or sibling class.

## OOP Design Concepts

**Collaborator Objects**: Objects that are stored as state within another object, helping to define its state and behavior.

**Composition**: Building complex objects by combining simpler ones.

**Aggregation**: A special form of composition where the component objects can exist independently.

**Has-a Relationship**: Describes the relationship in composition or aggregation.

**Is-a Relationship**: Describes the relationship in inheritance.

**CRC Card**: Class-Responsibility-Collaborator card, a design tool for planning object-oriented systems.

**Coupling**: The degree to which one class depends on another.

**Cohesion**: The degree to which elements within a class belong together.

**Law of Demeter**: A design guideline suggesting that objects should only talk to their immediate friends.

## Python OOP Customization

**Operator Overloading**: Customizing how operators work with custom objects using special methods.

**Equality**: Customized with `__eq__` to define how objects are compared.

**Hash Value**: Customized with `__hash__` to define how objects work in dictionaries and sets.

**String Representation**: Customized with `__str__` (informal, for users) and `__repr__` (formal, for developers).

**Callable Objects**: Objects that can be called like functions, implemented with `__call__`.

**Context Managers**: Objects that can be used with the `with` statement, implemented with `__enter__` and `__exit__`.

**Object Truthiness**: How objects evaluate in boolean contexts, customized with `__bool__`.

**Type Checking**: The practice of verifying an object's type, often with `isinstance()` or `type()`.

## Exception Handling

**Exception**: An error that occurs during program execution.

**Try/Except Block**: A structure to catch and handle exceptions.

**Custom Exception**: A user-defined exception class that inherits from a built-in exception class.

**Raise**: The keyword used to trigger an exception.

**Finally Clause**: Code that executes regardless of whether an exception occurred.

## Miscellaneous 

**Duck Typing**: A programming style which does not check types but instead checks for the presence of methods and properties.

**SOLID Principles**: A set of design principles for OOP (Single responsibility, Open-closed, Liskov substitution, Interface segregation, Dependency inversion).

**Immutable Object**: An object whose state cannot be modified after creation.

**Mutable Object**: An object whose state can be modified after creation.

**Factory Method**: A creational design pattern that provides an interface for creating objects.

**Singleton**: A design pattern ensuring a class has only one instance.
