# LS220: Introduction to Data Structures and Algorithms - Reference Sheet

## Big O Notation

```javascript
// O(1) - Constant time complexity
function getFirstElement(array) {
  return array[0];  // Always takes the same amount of time regardless of input size
}

// O(n) - Linear time complexity
function findElement(array, target) {
  for (let i = 0; i < array.length; i++) {
    if (array[i] === target) return i;
  }
  return -1;
}

// O(log n) - Logarithmic time complexity
function binarySearch(sortedArray, target) {
  let left = 0;
  let right = sortedArray.length - 1;
  
  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    if (sortedArray[mid] === target) return mid;
    if (sortedArray[mid] < target) left = mid + 1;
    else right = mid - 1;
  }
  
  return -1;
}

// O(n²) - Quadratic time complexity
function bubbleSort(array) {
  const n = array.length;
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n - i - 1; j++) {
      if (array[j] > array[j + 1]) {
        [array[j], array[j + 1]] = [array[j + 1], array[j]];  // Swap
      }
    }
  }
  return array;
}
```

## Sorting Algorithms

```javascript
// Bubble Sort - O(n²)
function bubbleSort(array) {
  const n = array.length;
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n - i - 1; j++) {
      if (array[j] > array[j + 1]) {
        [array[j], array[j + 1]] = [array[j + 1], array[j]];  // Swap
      }
    }
  }
  return array;
}

// Selection Sort - O(n²)
function selectionSort(array) {
  const n = array.length;
  for (let i = 0; i < n; i++) {
    let minIndex = i;
    for (let j = i + 1; j < n; j++) {
      if (array[j] < array[minIndex]) {
        minIndex = j;
      }
    }
    if (minIndex !== i) {
      [array[i], array[minIndex]] = [array[minIndex], array[i]];  // Swap
    }
  }
  return array;
}

// Insertion Sort - O(n²)
function insertionSort(array) {
  const n = array.length;
  for (let i = 1; i < n; i++) {
    let current = array[i];
    let j = i - 1;
    while (j >= 0 && array[j] > current) {
      array[j + 1] = array[j];
      j--;
    }
    array[j + 1] = current;
  }
  return array;
}
```

## Pointer-Based Techniques

```javascript
// Start/End technique - Finding a pair that sums to target in sorted array
function findPairWithSum(sortedArray, target) {
  let start = 0;
  let end = sortedArray.length - 1;
  
  while (start < end) {
    const sum = sortedArray[start] + sortedArray[end];
    if (sum === target) {
      return [sortedArray[start], sortedArray[end]];
    } else if (sum < target) {
      start++;
    } else {
      end--;
    }
  }
  
  return null;  // No pair found
}

// Anchor/Runner technique - Finding cycle in linked list
function hasCycle(head) {
  if (!head || !head.next) return false;
  
  let slow = head;       // Anchor
  let fast = head.next;  // Runner
  
  while (slow !== fast) {
    if (!fast || !fast.next) return false;
    slow = slow.next;        // Move by 1
    fast = fast.next.next;   // Move by 2
  }
  
  return true;  // Cycle detected
}
```

## Binary Search

```javascript
// Iterative Binary Search
function binarySearch(sortedArray, target) {
  let left = 0;
  let right = sortedArray.length - 1;
  
  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    
    if (sortedArray[mid] === target) {
      return mid;  // Found target
    } else if (sortedArray[mid] < target) {
      left = mid + 1;  // Search right half
    } else {
      right = mid - 1;  // Search left half
    }
  }
  
  return -1;  // Target not found
}

// Recursive Binary Search
function recursiveBinarySearch(sortedArray, target, left = 0, right = sortedArray.length - 1) {
  if (left > right) return -1;  // Base case: target not found
  
  const mid = Math.floor((left + right) / 2);
  
  if (sortedArray[mid] === target) {
    return mid;  // Found target
  } else if (sortedArray[mid] < target) {
    return recursiveBinarySearch(sortedArray, target, mid + 1, right);  // Search right half
  } else {
    return recursiveBinarySearch(sortedArray, target, left, mid - 1);  // Search left half
  }
}
```

## Linked Lists

```javascript
// Node class for Linked List
class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

// Linked List implementation
class LinkedList {
  constructor() {
    this.head = null;
    this.tail = null;
    this.length = 0;
  }
  
  // Add node to end of list
  append(value) {
    const newNode = new Node(value);
    
    if (!this.head) {
      this.head = newNode;
      this.tail = newNode;
    } else {
      this.tail.next = newNode;
      this.tail = newNode;
    }
    
    this.length++;
    return this;
  }
  
  // Add node to beginning of list
  prepend(value) {
    const newNode = new Node(value);
    
    if (!this.head) {
      this.head = newNode;
      this.tail = newNode;
    } else {
      newNode.next = this.head;
      this.head = newNode;
    }
    
    this.length++;
    return this;
  }
  
  // Get node at specific index
  get(index) {
    if (index < 0 || index >= this.length) return null;
    
    let current = this.head;
    for (let i = 0; i < index; i++) {
      current = current.next;
    }
    
    return current;
  }
  
  // Insert node at specific index
  insert(index, value) {
    if (index < 0 || index > this.length) return false;
    if (index === 0) return !!this.prepend(value);
    if (index === this.length) return !!this.append(value);
    
    const newNode = new Node(value);
    const prevNode = this.get(index - 1);
    
    newNode.next = prevNode.next;
    prevNode.next = newNode;
    
    this.length++;
    return true;
  }
  
  // Remove node at specific index
  remove(index) {
    if (index < 0 || index >= this.length) return null;
    if (index === 0) {
      const removed = this.head;
      this.head = this.head.next;
      if (this.length === 1) this.tail = null;
      this.length--;
      return removed;
    }
    
    const prevNode = this.get(index - 1);
    const removed = prevNode.next;
    
    prevNode.next = removed.next;
    if (index === this.length - 1) this.tail = prevNode;
    
    this.length--;
    return removed;
  }
  
  // Print list values
  print() {
    const values = [];
    let current = this.head;
    
    while (current) {
      values.push(current.value);
      current = current.next;
    }
    
    return values;
  }
}
```

## Stacks & Queues

```javascript
// Stack implementation (LIFO)
class Stack {
  constructor() {
    this.items = [];
  }
  
  push(element) {
    this.items.push(element);
  }
  
  pop() {
    if (this.isEmpty()) return "Underflow";
    return this.items.pop();
  }
  
  peek() {
    if (this.isEmpty()) return "No elements in Stack";
    return this.items[this.items.length - 1];
  }
  
  isEmpty() {
    return this.items.length === 0;
  }
  
  size() {
    return this.items.length;
  }
  
  print() {
    return [...this.items];
  }
}

// Queue implementation (FIFO)
class Queue {
  constructor() {
    this.items = [];
  }
  
  enqueue(element) {
    this.items.push(element);
  }
  
  dequeue() {
    if (this.isEmpty()) return "Underflow";
    return this.items.shift();
  }
  
  front() {
    if (this.isEmpty()) return "No elements in Queue";
    return this.items[0];
  }
  
  isEmpty() {
    return this.items.length === 0;
  }
  
  size() {
    return this.items.length;
  }
  
  print() {
    return [...this.items];
  }
}
```

## Recursion

```javascript
// Factorial calculation using recursion
function factorial(n) {
  // Base case
  if (n === 0 || n === 1) return 1;
  
  // Recursive case
  return n * factorial(n - 1);
}

// Fibonacci sequence using recursion
function fibonacci(n) {
  // Base cases
  if (n <= 0) return 0;
  if (n === 1) return 1;
  
  // Recursive case
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// Improved Fibonacci with memoization
function fibonacciMemo(n, memo = {}) {
  if (n in memo) return memo[n];
  if (n <= 0) return 0;
  if (n === 1) return 1;
  
  memo[n] = fibonacciMemo(n - 1, memo) + fibonacciMemo(n - 2, memo);
  return memo[n];
}
```

## Binary Trees

```javascript
// Node class for Binary Tree
class TreeNode {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}

// Binary Search Tree implementation
class BinarySearchTree {
  constructor() {
    this.root = null;
  }
  
  // Insert a value
  insert(value) {
    const newNode = new TreeNode(value);
    
    if (!this.root) {
      this.root = newNode;
      return this;
    }
    
    let current = this.root;
    
    while (true) {
      if (value === current.value) return this;  // No duplicates
      
      if (value < current.value) {
        if (!current.left) {
          current.left = newNode;
          return this;
        }
        current = current.left;
      } else {
        if (!current.right) {
          current.right = newNode;
          return this;
        }
        current = current.right;
      }
    }
  }
  
  // Find a value
  find(value) {
    if (!this.root) return false;
    
    let current = this.root;
    let found = false;
    
    while (current && !found) {
      if (value < current.value) {
        current = current.left;
      } else if (value > current.value) {
        current = current.right;
      } else {
        found = true;
      }
    }
    
    return found ? current : false;
  }
  
  // Breadth-First Search traversal
  BFS() {
    let node = this.root;
    const data = [];
    const queue = [];
    
    if (!node) return data;
    
    queue.push(node);
    
    while (queue.length) {
      node = queue.shift();
      data.push(node.value);
      
      if (node.left) queue.push(node.left);
      if (node.right) queue.push(node.right);
    }
    
    return data;
  }
  
  // Depth-First Search: Pre-order traversal (root, left, right)
  DFSPreOrder() {
    const data = [];
    
    function traverse(node) {
      data.push(node.value);
      if (node.left) traverse(node.left);
      if (node.right) traverse(node.right);
    }
    
    if (this.root) traverse(this.root);
    return data;
  }
  
  // Depth-First Search: In-order traversal (left, root, right)
  DFSInOrder() {
    const data = [];
    
    function traverse(node) {
      if (node.left) traverse(node.left);
      data.push(node.value);
      if (node.right) traverse(node.right);
    }
    
    if (this.root) traverse(this.root);
    return data;
  }
  
  // Depth-First Search: Post-order traversal (left, right, root)
  DFSPostOrder() {
    const data = [];
    
    function traverse(node) {
      if (node.left) traverse(node.left);
      if (node.right) traverse(node.right);
      data.push(node.value);
    }
    
    if (this.root) traverse(this.root);
    return data;
  }
}
```
