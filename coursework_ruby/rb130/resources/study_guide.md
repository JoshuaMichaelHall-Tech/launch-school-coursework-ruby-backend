# RB130: Ruby Foundations: More Topics - Study Guide

## Fundamental Topics

### 1. Blocks and Closures
- **Closures in Ruby**: Understanding blocks, Procs, and lambdas
- **Binding**: How closures capture their surrounding environment
- **Variable scope**: How blocks interact with local variables
- **Execution context**: Where blocks run versus where they're defined
- **Use cases**: When and why to use blocks in your code

### 2. Method Yielding
- **Basic yielding**: Using the `yield` keyword
- **Conditional yielding**: Using `block_given?`
- **Passing arguments to blocks**: `yield(arg1, arg2)`
- **Handling return values from blocks**: Capturing and using the result
- **Block implementation of iterators**: How methods like `each` work

### 3. Testing Fundamentals
- **Minitest basics**: Setting up and running tests
- **Assertions**: Using various assertion methods
- **Test structure**: Setup, execution, assertion, teardown (SEAT)
- **Test organization**: Grouping related tests
- **Testing practices**: What to test and when

### 4. Custom Iterators
- **Creating methods that take blocks**: Basic block handling
- **Implementing collection methods**: `each`, `map`, `select`, etc.
- **Return values and enumerability**: Making your objects enumerable
- **Yielding with different arguments**: Flexible block interactions
- **Enumerable mixin**: Leveraging Ruby's built-in module

### 5. Core Tools
- **Bundler**: Managing dependencies
- **Gemfile format**: Specifying gems and versions
- **Rake**: Automating common tasks
- **RubyGems**: Using and creating gems
- **Testing tools**: Minitest and extensions

## Deep Dive Areas

### Block Binding and Scope
- How closures maintain access to their creation environment
- Variables accessible within blocks
- Local variables created inside blocks
- Modifying variables from outer scope
- Closure lifetime and potential memory implications

### Explicit vs. Implicit Blocks
- When to use `&block` parameter vs. simple `yield`
- Converting blocks to Procs and vice versa
- Passing blocks between methods
- Performance considerations
- Design implications

### Testing Approaches
- Unit testing: Testing individual components
- Integration testing: Testing component interactions
- Test-driven development (TDD): Writing tests first
- Mocks and stubs: Isolating code under test
- Assertion styles: Assert vs. spec/expectations

### Proc vs. Lambda
- Arity checking (strict vs. lenient)
- Return behavior differences
- When to use each type
- Converting between Procs and lambdas
- Best practices and pitfalls

### Symbol to Proc
- Using shorthand `&:method_name` syntax
- How it works under the hood
- Common use cases with iterators
- Limitations and edge cases
- Building custom conversions

## Study Strategies

### 1. Implement Custom Collection Methods
- Build your own versions of `each`, `map`, `select`, `reduce`
- Start with simple implementations and refine
- Test with various input types and edge cases
- Compare your implementation with Ruby's built-in methods
- Experiment with performance optimizations

### 2. Write Tests for Your Own Code
- Practice Test-Driven Development (TDD)
- Write comprehensive test suites
- Cover edge cases and failure conditions
- Refactor tests for clarity and maintainability
- Test custom iterators and block-taking methods

### 3. Experiment with Block Scoping Rules
- Create examples showing different scoping behaviors
- Test variable access and modification
- Compare blocks, Procs, and lambdas
- Explore nested blocks and scope inheritance
- Trace execution flow in complex examples

### 4. Master Testing Methodologies
- Use the SEAT approach (Setup, Execute, Assert, Teardown)
- Practice writing assertion-based tests
- Experiment with expectation syntax
- Build test helpers and shared examples
- Generate test coverage reports

### 5. Build Practical Tools with Blocks
- Implement DSLs using blocks
- Create resource management utilities
- Build custom iterators for specialized collections
- Develop block-based middleware or filters
- Explore metaprogramming with blocks and Procs
