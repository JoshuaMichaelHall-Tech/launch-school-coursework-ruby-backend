# RB101: Programming Foundations with Ruby: Basics (Extended) - Study Guide

## Essential Concepts

### 1. Method Definition vs. Invocation
- Understanding the difference between creating a method (`def`) and calling it
- Implications for variable scope and flow control
- How method invocation with a block differs from method definition
- Return values vs. side effects

### 2. Pass by Reference vs. Value
- Ruby uses pass by reference value (also called call by sharing)
- Objects can be modified within methods if mutating methods are used
- Reassignment within methods doesn't affect the original variable
- Tracking changes using `object_id`

### 3. Variable Scope
- Local variables in method definitions are self-contained
- Local variables in blocks can access outer scope variables
- Inner scope can't be accessed from an outer scope
- Variables initialized in loops, if statements, etc.
- Nested blocks create nested scopes

### 4. Mutating vs. Non-mutating Operations
- Which operations modify objects in place vs. create new objects
- Common mutating methods: `<<`, `[]=`, methods ending with `!`
- Common non-mutating methods: `+`, `map`, `select`
- Implications for method arguments and return values
- Debugging issues related to unexpected mutation

### 5. Block Usage
- When and how to use blocks effectively
- Implicit and explicit blocks
- Passing arguments to blocks
- Return values from blocks and how they're used
- Common use cases: iteration, conditional execution, callbacks

## Deep Dive Topics

### Constants
- Scope behavior compared to local variables
- Accessibility across classes and modules
- Warning when reassigning constants

### Default Parameters
- How they work and when to use them
- Order and combination with required parameters
- Edge cases and gotchas

### Return Values
- Implicit vs. explicit returns
- Early returns with the `return` keyword
- How return values propagate through method chains
- Return values of common Ruby methods

### Object IDs
- How they help understand variable references
- Tracking changes to objects vs. reassignment
- Debugging techniques using object identity
- Comparing object identity vs. equality (`equal?` vs. `==`)

### Parameter Passing
- How objects are passed to methods
- The effects of mutation within methods
- Protecting arguments from mutation
- Multiple parameters and argument order

## Study Tips

### 1. Practice Tracing Code Execution
- Step through code line by line
- Track variable values and object IDs
- Predict outcomes before running code
- Examine edge cases and boundary conditions

### 2. Test in IRB
- Experiment with variable scope rules
- Test object mutation vs. reassignment
- Examine return values of blocks and methods
- Explore Ruby's standard library methods

### 3. Focus on Understanding Concepts
- Differentiate between reassignment and mutation
- Understand how blocks interact with variable scope
- Master the nuances of Ruby's truthiness
- Learn to predict side effects vs. return values

### 4. Build Debugging Skills
- Use `puts` to inspect variables and flow control
- Add debugging statements to track execution
- Test small code snippets in isolation
- Learn to read and understand error messages

### 5. Develop Mental Models
- Visualize variables as pointers to objects
- Understand method calls as a form of message passing
- See blocks as closures that capture their environment
- Recognize common programming patterns
