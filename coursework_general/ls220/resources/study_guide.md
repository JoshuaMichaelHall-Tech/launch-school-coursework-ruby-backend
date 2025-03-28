# LS220: Introduction to Data Structures and Algorithms - Study Guide

## Big O Notation

### Key Concepts:

1. **Understanding Time Complexity**
   - How algorithm runtime scales with input size
   - Worst-case, average-case, and best-case scenarios
   - Simplified asymptotic analysis (dropping constants and non-dominant terms)

2. **Common Time Complexities**
   - O(1): Constant time
   - O(log n): Logarithmic time
   - O(n): Linear time
   - O(n log n): Linearithmic time
   - O(n²): Quadratic time
   - O(2^n): Exponential time
   - O(n!): Factorial time

3. **Space Complexity**
   - Memory usage in relation to input size
   - Auxiliary space vs. input space
   - Trade-offs between time and space complexity

4. **Analyzing Complex Algorithms**
   - Identifying bottlenecks in code
   - Nested loops and recursive calls
   - Dominant operations

### Practice Questions:

1. Analyze the time and space complexity of binary search.
2. Compare the efficiency of bubble sort, selection sort, and insertion sort.
3. What is the time complexity of iterating through a 2D array of size n×n?
4. How does memoization affect the time complexity of recursive algorithms?
5. Identify the time complexity of common array operations (access, search, insert, delete).

## Sorting Algorithms

### Key Concepts:

1. **Bubble Sort**
   - Compare adjacent elements and swap if needed
   - Time complexity: O(n²)
   - Space complexity: O(1)
   - Simple but inefficient for large datasets

2. **Selection Sort**
   - Find minimum element and place it at the beginning
   - Time complexity: O(n²)
   - Space complexity: O(1)
   - Performs fewer swaps than bubble sort

3. **Insertion Sort**
   - Build sorted array one element at a time
   - Time complexity: O(n²)
   - Space complexity: O(1)
   - Efficient for small or nearly sorted datasets

4. **Algorithm Stability**
   - Maintaining relative order of equal elements
   - Important for certain applications

5. **In-place vs. Out-of-place Sorting**
   - In-place algorithms use minimal extra space
   - Trade-offs between memory usage and efficiency

### Practice Questions:

1. Implement bubble sort and optimize it to stop early if the array becomes sorted.
2. How would you determine if an array is already sorted using insertion sort?
3. Compare and contrast the performance characteristics of the three basic sorting algorithms.
4. When would you choose one sorting algorithm over another?
5. How can you sort an array of objects based on a specific property?

## Pointer-Based Mental Models

### Key Concepts:

1. **Start/End Technique**
   - Pointers at opposite ends moving toward each other
   - Applications: two-sum problem, palindrome checking
   - Efficient for sorted arrays

2. **Anchor/Runner Technique**
   - One pointer moves faster than the other
   - Applications: cycle detection, finding middle elements
   - Often used with linked lists

3. **Sliding Window**
   - Fixed or variable-size window sliding through array
   - Applications: substring problems, maximum sum subarray
   - Optimizes time complexity for certain array problems

4. **Multiple Pointers Pattern**
   - Using two or more pointers to process data
   - Different movement patterns for different problems
   - Reduces time complexity for many array problems

### Practice Questions:

1. Implement the two-pointer technique to determine if a string is a palindrome.
2. Use the anchor/runner technique to find the middle of a linked list.
3. How would you use the sliding window technique to find the maximum sum subarray of size k?
4. Implement a solution to find all pairs in a sorted array that sum to a target value.
5. Use multiple pointers to remove duplicates from a sorted array in-place.

## Binary Search

### Key Concepts:

1. **Prerequisites and Limitations**
   - Requires sorted data
   - Random access capability (arrays, not linked lists)
   - Time complexity: O(log n)

2. **Implementation Approaches**
   - Iterative vs. recursive implementation
   - Handling edge cases (empty arrays, target not found)
   - Mid-point calculation to avoid overflow: `mid = left + (right - left) / 2`

3. **Variations**
   - Finding first/last occurrence
   - Searching in rotated sorted arrays
   - Finding closest element if exact match doesn't exist

4. **Applications**
   - Database indexing
   - Dictionary lookups
   - Efficient search in large datasets

### Practice Questions:

1. Implement binary search both iteratively and recursively.
2. How would you find the first and last occurrence of a value in a sorted array?
3. Apply binary search to find an element in a rotated sorted array.
4. Use binary search to find the square root of a number (rounded down).
5. How would you implement binary search in a real-world application?

## Linked Lists

### Key Concepts:

1. **Types of Linked Lists**
   - Singly linked: nodes point to next node
   - Doubly linked: nodes point to both next and previous nodes
   - Circular: last node points to first node

2. **Basic Operations**
   - Traversal, insertion, deletion
   - Time and space complexity of each operation
   - Edge cases (empty list, single-element list)

3. **Common Techniques**
   - Runner technique for cycle detection
   - Dummy head node for simplified edge cases
   - Reversing a linked list

4. **Applications**
   - Implementation of stacks and queues
   - LRU cache
   - Memory allocation

### Practice Questions:

1. Implement a function to reverse a singly linked list.
2. How would you detect a cycle in a linked list?
3. Write a function to find the kth node from the end of a linked list.
4. Implement a function to merge two sorted linked lists.
5. How would you determine if two linked lists intersect?

## Stacks & Queues

### Key Concepts:

1. **Stack Properties and Operations**
   - LIFO (Last-In-First-Out) principle
   - Push, pop, peek, isEmpty operations
   - Implementation using arrays or linked lists
   - Time complexity: O(1) for all operations

2. **Queue Properties and Operations**
   - FIFO (First-In-First-Out) principle
   - Enqueue, dequeue, front, isEmpty operations
   - Implementation using arrays or linked lists
   - Time complexity: O(1) for all operations (with proper implementation)

3. **Variations**
   - Priority queue
   - Deque (double-ended queue)
   - Circular queue

4. **Applications**
   - Function call stack
   - Expression evaluation
   - Breadth-first search (queue) and depth-first search (stack)

### Practice Questions:

1. Implement a stack using two queues.
2. Use a stack to evaluate a postfix expression.
3. Implement a queue using two stacks.
4. How would you design a min stack (a stack with a min operation)?
5. Solve the balanced parentheses problem using a stack.

## Recursion

### Key Concepts:

1. **Components of Recursion**
   - Base case(s)
   - Recursive case
   - State management between calls

2. **Types of Recursion**
   - Direct vs. indirect recursion
   - Linear vs. multiple recursion
   - Tail recursion and optimization

3. **Common Issues**
   - Stack overflow
   - Redundant calculations
   - Optimization techniques (memoization, tail recursion)

4. **Recursive vs. Iterative Solutions**
   - Trade-offs in readability and performance
   - Problems well-suited for recursive solutions

### Practice Questions:

1. Implement a recursive solution for factorial and Fibonacci sequence.
2. How would you optimize a recursive Fibonacci function?
3. Write a recursive function to calculate the power of a number.
4. Use recursion to solve the Tower of Hanoi problem.
5. Implement a recursive binary tree traversal (pre-order, in-order, post-order).

## Divide and Conquer

### Key Concepts:

1. **Algorithm Pattern**
   - Divide the problem into smaller subproblems
   - Solve subproblems recursively
   - Combine solutions to subproblems

2. **Examples**
   - Merge sort
   - Quick sort
   - Binary search
   - Strassen's matrix multiplication

3. **Analysis**
   - Time complexity often O(n log n)
   - Recurrence relations for analyzing complexity
   - Master theorem for solving recurrences

### Practice Questions:

1. Implement merge sort and analyze its time complexity.
2. How would you apply the divide and conquer approach to find the maximum subarray sum?
3. Implement the closest pair of points problem using divide and conquer.
4. Compare divide and conquer with dynamic programming.
5. Analyze the time complexity of the quicksort algorithm.

## Dynamic Programming

### Key Concepts:

1. **Core Principles**
   - Optimal substructure
   - Overlapping subproblems
   - Memoization and tabulation techniques

2. **Approaches**
   - Top-down (recursive with memoization)
   - Bottom-up (iterative with tabulation)
   - Space optimization techniques

3. **Common Problems**
   - Fibonacci sequence
   - Longest common subsequence
   - Knapsack problem
   - Shortest path algorithms

4. **State Design**
   - Identifying state variables
   - Transition between states
   - Base cases and boundaries

### Practice Questions:

1. Implement both top-down and bottom-up solutions for the Fibonacci sequence.
2. Solve the coin change problem using dynamic programming.
3. How would you approach the 0/1 knapsack problem?
4. Implement the longest common subsequence algorithm.
5. Use dynamic programming to find the maximum sum path in a grid.

## Binary Trees

### Key Concepts:

1. **Tree Terminology**
   - Root, nodes, leaves, height, depth
   - Binary tree properties
   - Full, complete, and perfect binary trees

2. **Binary Search Tree (BST)**
   - Properties and invariants
   - Basic operations (insert, search, delete)
   - Time complexity analysis

3. **Tree Traversals**
   - Depth-first: pre-order, in-order, post-order
   - Breadth-first (level-order)
   - Applications of different traversals

4. **Tree Problems**
   - Height and balance
   - Lowest common ancestor
   - Path sum problems
   - Serialization and deserialization

### Practice Questions:

1. Implement a binary search tree with insert, search, and delete operations.
2. Write functions for all three depth-first traversals.
3. How would you determine if a binary tree is balanced?
4. Implement a function to find the lowest common ancestor of two nodes in a binary tree.
5. Convert a binary search tree to a sorted linked list.

## Graphs

### Key Concepts:

1. **Graph Representations**
   - Adjacency matrix
   - Adjacency list
   - Edge list
   - Trade-offs between representations

2. **Graph Types**
   - Directed vs. undirected
   - Weighted vs. unweighted
   - Cyclic vs. acyclic
   - Connected vs. disconnected

3. **Graph Traversals**
   - Depth-first search (DFS)
   - Breadth-first search (BFS)
   - Applications and time complexity

4. **Graph Algorithms**
   - Shortest path (Dijkstra's, Bellman-Ford)
   - Minimum spanning tree (Prim's, Kruskal's)
   - Topological sort
   - Cycle detection

### Practice Questions:

1. Implement both DFS and BFS for a graph.
2. How would you detect a cycle in a directed graph?
3. Implement Dijkstra's algorithm for finding the shortest path.
4. Use topological sorting for dependency resolution.
5. Find all connected components in an undirected graph.

## Backtracking

### Key Concepts:

1. **Algorithm Pattern**
   - Incremental solution building
   - Constraint-based pruning
   - State space exploration

2. **Implementation Framework**
   - Decision making at each step
   - Reverting decisions when constraints violated
   - Recursive exploration of possibilities

3. **Common Applications**
   - N-Queens problem
   - Sudoku solver
   - Permutations and combinations
   - Subset sum problems

4. **Optimization Techniques**
   - Pruning branches early
   - Ordering choices for faster solutions
   - Combining with other techniques

### Practice Questions:

1. Implement a solution for the N-Queens problem.
2. Create a Sudoku solver using backtracking.
3. Generate all permutations of a given string.
4. Solve the subset sum problem using backtracking.
5. How would you optimize a backtracking algorithm?

## Exam Preparation Tips

1. **Focus on Implementations**
   - Practice coding each data structure from scratch
   - Implement algorithms without referring to notes
   - Test with various edge cases

2. **Analyze Time and Space Complexity**
   - For every algorithm, be able to explain its complexity
   - Identify bottlenecks and optimization opportunities
   - Compare different approaches to the same problem

3. **Practice Problem Solving**
   - Work through diverse problems
   - Apply appropriate data structures and algorithms
   - Explain your reasoning and approach

4. **Study Algorithm Patterns**
   - Recognize when to use specific techniques
   - Understand trade-offs between different approaches
   - Apply patterns to solve novel problems

5. **Review Edge Cases**
   - Empty inputs, single elements
   - Boundaries and extreme values
   - Invalid inputs and error handling
