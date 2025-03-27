# RB110: Programming Foundations with Ruby: Intermediate - Glossary

## Collections and Iteration

**Iteration**
: Cycling through a collection one element at a time

**Selection**
: Filtering a collection based on criteria to create a new collection

**Transformation**
: Creating a new collection by applying changes to each element of the original

**Nested Collection**
: Collection containing other collections (arrays within arrays, hashes within arrays, etc.)

**Method Chaining**
: Invoking multiple methods in sequence, where each method is called on the return value of the previous method

**Enumerable**
: Module providing collection iteration methods like `each`, `map`, `select`, etc.

**PEDAC**
: Problem, Examples, Data structure, Algorithm, Code - a problem-solving approach

**Shallow Copy**
: Copy that doesn't duplicate nested objects (only the top level collection is copied)

**Deep Copy**
: Copy that duplicates all levels of nested objects

## Collection Methods

**each**
: Basic iterator that returns the original collection

**map/collect**
: Transforms each element and returns a new collection with the results

**select/filter**
: Returns a new collection of elements that meet the criteria specified in the block

**reject**
: Returns a new collection excluding elements that meet the criteria specified in the block

**any?**
: Returns true if at least one element meets the criteria in the block

**all?**
: Returns true if all elements meet the criteria in the block

**each_with_index**
: Iterator providing both the element and its index as block parameters

**each_with_object**
: Iterator that maintains a collection throughout iteration

**sort**
: Orders elements based on comparison using the spaceship operator (`<=>`)

**sort_by**
: Orders elements based on the return value of the block for each element
