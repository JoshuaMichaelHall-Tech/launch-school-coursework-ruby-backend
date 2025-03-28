# LS215: Computational Thinking and Problem Solving - Reference Sheet

## Array Processing Methods

### Iteration

```javascript
// forEach - executes a function on each element
[1, 2, 3].forEach(num => console.log(num));

// for...of - loops through iterable objects
for (let num of [1, 2, 3]) {
  console.log(num);
}
```

### Filtering/Selection

```javascript
// filter - creates a new array with elements that pass the test
let evenNumbers = [1, 2, 3, 4, 5].filter(num => num % 2 === 0);
// => [2, 4]

// find - returns the first element that passes the test
let firstEven = [1, 2, 3, 4, 5].find(num => num % 2 === 0);
// => 2

// findIndex - returns the index of the first element that passes the test
let firstEvenIndex = [1, 2, 3, 4, 5].findIndex(num => num % 2 === 0);
// => 1

// some - tests if at least one element passes the test
let hasEven = [1, 2, 3, 4, 5].some(num => num % 2 === 0);
// => true

// every - tests if all elements pass the test
let allEven = [1, 2, 3, 4, 5].every(num => num % 2 === 0);
// => false
```

### Transformation

```javascript
// map - creates a new array with results of calling a function on every element
let doubled = [1, 2, 3].map(num => num * 2);
// => [2, 4, 6]

// flatMap - maps each element using a mapping function, then flattens the result
let nestedArrays = [[1], [2, 3], [4]];
let flattened = nestedArrays.flatMap(arr => arr);
// => [1, 2, 3, 4]
```

### Reducing/Folding

```javascript
// reduce - applies a function against an accumulator and each element
let sum = [1, 2, 3, 4, 5].reduce((acc, num) => acc + num, 0);
// => 15

// reduceRight - like reduce but works from right to left
let reversed = ['a', 'b', 'c'].reduceRight((acc, char) => acc + char, '');
// => 'cba'
```

## String Processing Methods

```javascript
// split - splits a string into an array of substrings
'hello world'.split(' ');
// => ['hello', 'world']

// join - joins array elements into a string
['hello', 'world'].join(' ');
// => 'hello world'

// substring/slice - extracts characters between indices
'hello world'.substring(0, 5);
// => 'hello'
'hello world'.slice(0, 5);
// => 'hello'

// replace - replaces matched substring with a replacement
'hello world'.replace('world', 'javascript');
// => 'hello javascript'

// match - retrieves matches from a string against a regex
'hello 123 world 456'.match(/\d+/g);
// => ['123', '456']

// includes - checks if a string contains a specified string
'hello world'.includes('world');
// => true

// startsWith/endsWith - checks if a string starts/ends with a specified string
'hello world'.startsWith('hello');
// => true
'hello world'.endsWith('world');
// => true
```

## Regular Expressions

```javascript
// Basic pattern matching
let pattern = /abc/;
pattern.test('abcdef');  // => true

// Character classes
let digits = /\d+/;  // Match one or more digits
'abc123'.match(digits);  // => ['123']

// Anchors
let startAnchor = /^Hello/;  // Must start with "Hello"
startAnchor.test('Hello world');  // => true

let endAnchor = /world$/;  // Must end with "world"
endAnchor.test('Hello world');  // => true

// Capture groups
let namePattern = /My name is (.*)/;
'My name is John'.match(namePattern)[1];  // => 'John'

// Quantifiers
let zeroOrMore = /ab*c/;  // "a" followed by zero or more "b"s, followed by "c"
zeroOrMore.test('ac');  // => true
zeroOrMore.test('abc');  // => true
zeroOrMore.test('abbc');  // => true

// Email validation example
let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
emailPattern.test('user@example.com');  // => true
```

## PEDAC Problem Solving Process

```javascript
// Example implementation following PEDAC process

// Problem: Write a function that returns the sum of the squares of numbers from 1 to n

// 1. Problem
// - Input: A number n
// - Output: Sum of squares from 1 to n
// - Rules: n is a positive integer

// 2. Examples
// sumOfSquares(1) => 1
// sumOfSquares(2) => 1 + 4 = 5
// sumOfSquares(3) => 1 + 4 + 9 = 14

// 3. Data Structure: Array to store numbers 1 to n

// 4. Algorithm:
// - Create an array of numbers from 1 to n
// - Square each number
// - Sum the squared numbers

// 5. Code:
function sumOfSquares(n) {
  let numbers = Array.from({ length: n }, (_, index) => index + 1);
  let squares = numbers.map(num => num * num);
  return squares.reduce((sum, square) => sum + square, 0);
}

// Testing
console.log(sumOfSquares(1));  // => 1
console.log(sumOfSquares(2));  // => 5
console.log(sumOfSquares(3));  // => 14
```
