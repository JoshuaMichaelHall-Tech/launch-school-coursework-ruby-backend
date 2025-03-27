# RB130: Ruby Foundations: More Topics - Glossary

## Ruby Blocks and Testing

**Closure**
: Chunk of code that can be passed around and retains references to its surrounding scope

**Block**
: Ruby's implementation of a closure, anonymous piece of code that can be passed to methods

**Proc**
: Object-oriented version of a block, can be stored in a variable and passed around

**Lambda**
: Stricter version of a Proc with enforced arity and different return behavior

**Yield**
: Keyword used within methods to invoke the block passed to that method

**Block_given?**
: Method to check if a block was provided to a method

**Binding**
: The surrounding environment/context that a closure retains access to

**Explicit Block**
: Block converted to a Proc object using the `&` operator in a method parameter

**Implicit Block**
: Block passed to a method without being converted to a parameter

**Arity**
: Rules about the number of arguments that can be passed to blocks, procs, lambdas, or methods

**Minitest**
: Ruby's built-in testing library, comes as a standard gem with Ruby

**Assertion**
: Verification step in testing that confirms expected behavior

**Test Suite**
: Set of tests for a project, including test cases and helpers

**Test**
: Situation or context in which tests are run, containing multiple assertions

**Bundler**
: Gem dependency manager that ensures consistent environments 

**Gemfile**
: File listing dependencies for a Ruby project

**Gemfile.lock**
: File that records the exact versions of gems installed by Bundler

**Rake**
: Task automation tool commonly used in Ruby projects
