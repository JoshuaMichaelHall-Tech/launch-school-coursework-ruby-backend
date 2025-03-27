# JS210: Fundamentals of JavaScript for Programmers - Reference Sheet

## Data Types and Variables

```javascript
// Primitive Types
let string = 'Hello, world!';     // String
let number = 42;                  // Number
let boolean = true;               // Boolean
let nullValue = null;             // Null
let undefinedValue;               // Undefined
let symbolValue = Symbol('sym');  // Symbol

// Variable Declaration
var oldVariable = 'var has function scope';
let blockScopedVariable = 'let has block scope';
const constant = 'const cannot be reassigned';

// Type Checking
typeof string;         // 'string'
typeof number;         // 'number'
typeof boolean;        // 'boolean'
typeof nullValue;      // 'object' (quirk in JavaScript)
typeof undefinedValue; // 'undefined'
typeof symbolValue;    // 'symbol'
```

## Operators

```javascript
// Arithmetic
1 + 2;     // Addition: 3
3 - 1;     // Subtraction: 2
2 * 3;     // Multiplication: 6
6 / 2;     // Division: 3
7 % 3;     // Remainder: 1
2 ** 3;    // Exponentiation: 8

// Comparison
1 === 1;   // Strict equality: true
1 !== 2;   // Strict inequality: true
1 == '1';  // Loose equality: true
1 != '2';  // Loose inequality: true
1 > 0;     // Greater than: true
1 >= 1;    // Greater than or equal: true
0 < 1;     // Less than: true
0 <= 0;    // Less than or equal: true

// Logical
true && false; // Logical AND: false
true || false; // Logical OR: true
!true;         // Logical NOT: false

// Assignment
let x = 1;     // Basic assignment
x += 1;        // x = x + 1 (now 2)
x -= 1;        // x = x - 1 (now 1)
x *= 3;        // x = x * 3 (now 3)
x /= 3;        // x = x / 3 (now 1)
x %= 1;        // x = x % 1 (now 0)
```

## Conditionals and Loops

```javascript
// if...else Statement
if (condition) {
  // code to execute if condition is true
} else if (anotherCondition) {
  // code to execute if anotherCondition is true
} else {
  // code to execute if all conditions are false
}

// Switch Statement
switch (value) {
  case 1:
    // code to execute if value === 1
    break;
  case 2:
    // code to execute if value === 2
    break;
  default:
    // code to execute if no cases match
    break;
}

// Ternary Operator
let result = condition ? 'value if true' : 'value if false';

// for Loop
for (let i = 0; i < 5; i += 1) {
  // code to execute in each iteration
}

// while Loop
let i = 0;
while (i < 5) {
  // code to execute in each iteration
  i += 1;
}

// do...while Loop
let j = 0;
do {
  // code to execute in each iteration
  j += 1;
} while (j < 5);

// for...in Loop (for Object Properties)
const object = { a: 1, b: 2, c: 3 };
for (const property in object) {
  console.log(`${property}: ${object[property]}`);
}

// for...of Loop (for Iterable Objects)
const array = [1, 2, 3];
for (const element of array) {
  console.log(element);
}
```

## Functions

```javascript
// Function Declaration
function functionName(parameter1, parameter2) {
  // function body
  return value; // optional return statement
}

// Function Expression
const functionName = function(parameter1, parameter2) {
  // function body
  return value; // optional return statement
};

// Arrow Function
const functionName = (parameter1, parameter2) => {
  // function body
  return value; // optional return statement
};

// Shorthand for simple arrow functions
const double = num => num * 2;

// Default Parameters
function greet(name = 'World') {
  return `Hello, ${name}!`;
}

// Rest Parameters
function sum(...numbers) {
  return numbers.reduce((total, num) => total + num, 0);
}

// Function as Argument (Callback)
function callFunction(callback) {
  callback();
}

callFunction(function() {
  console.log('Callback executed!');
});
```

## Arrays

```javascript
// Array Creation
let array = [1, 2, 3, 4, 5];
let emptyArray = [];
let mixedArray = [1, 'two', true, null, [5, 6]];

// Accessing Elements
array[0];  // First element: 1
array[4];  // Last element: 5
array[-1]; // Not valid in JavaScript, returns undefined

// Array Methods
array.push(6);           // Adds to the end, returns new length
array.pop();             // Removes from the end, returns removed element
array.unshift(0);        // Adds to the beginning, returns new length
array.shift();           // Removes from the beginning, returns removed element
array.concat([6, 7, 8]); // Combines arrays, returns new array
array.slice(1, 3);       // Returns a section [2, 3]
array.splice(1, 2, 'a'); // Removes elements, adds new ones, returns removed
array.join(', ');        // Converts array to string: "1, 2, 3, 4, 5"
array.indexOf(3);        // Finds index of element: 2
array.lastIndexOf(3);    // Finds last index of element: 2
array.includes(3);       // Checks if array includes element: true
array.reverse();         // Reverses array in place
array.sort();            // Sorts array in place

// Iteration Methods
array.forEach(num => console.log(num));  // Executes function on each element
array.map(num => num * 2);               // Returns new array with transformed elements
array.filter(num => num % 2 === 0);      // Returns new array with elements that pass test
array.find(num => num > 3);              // Returns first element that passes test
array.findIndex(num => num > 3);         // Returns index of first element that passes test
array.every(num => num < 10);            // Checks if all elements pass test
array.some(num => num > 4);              // Checks if any element passes test
array.reduce((sum, num) => sum + num, 0); // Reduces array to single value
```

## Objects

```javascript
// Object Creation
let person = {
  name: 'John',
  age: 30,
  isEmployed: true
};

// Accessing Properties
person.name;       // Dot notation: 'John'
person['name'];    // Bracket notation: 'John'

// Adding/Changing Properties
person.location = 'USA';      // Adds new property
person['occupation'] = 'Developer'; // Adds new property
person.age = 31;              // Changes existing property

// Deleting Properties
delete person.isEmployed;     // Removes property

// Object Methods
const keys = Object.keys(person);         // Returns array of keys
const values = Object.values(person);     // Returns array of values
const entries = Object.entries(person);   // Returns array of [key, value] pairs
const personCopy = Object.assign({}, person); // Creates shallow copy
const hasProp = Object.hasOwn(person, 'name'); // Checks if object has own property

// Object with Methods
let calculator = {
  value: 0,
  add(num) {
    this.value += num;
    return this;
  },
  subtract(num) {
    this.value -= num;
    return this;
  },
  getValue() {
    return this.value;
  }
};

calculator.add(5).subtract(2).getValue(); // Method chaining: 3
```

## Strings

```javascript
// String Creation
let singleQuotes = 'Hello, world!';
let doubleQuotes = "Hello, world!";
let templateLiteral = `Hello, ${name}!`; // String interpolation

// String Properties
singleQuotes.length; // Number of characters: 13

// String Methods
singleQuotes.charAt(0);             // Character at index: 'H'
singleQuotes.charCodeAt(0);         // UTF-16 code of character: 72
singleQuotes.concat(' Welcome!');   // Combines strings: 'Hello, world! Welcome!'
singleQuotes.includes('world');     // Checks if string contains substring: true
singleQuotes.endsWith('!');         // Checks if string ends with substring: true
singleQuotes.startsWith('Hello');   // Checks if string starts with substring: true
singleQuotes.indexOf('world');      // Position of first occurrence: 7
singleQuotes.lastIndexOf('o');      // Position of last occurrence: 8
singleQuotes.match(/world/);        // Searches string against regex
singleQuotes.repeat(2);             // Repeats string: 'Hello, world!Hello, world!'
singleQuotes.replace('world', 'JavaScript'); // Replaces substring: 'Hello, JavaScript!'
singleQuotes.search(/world/);       // Searches for match: 7
singleQuotes.slice(0, 5);           // Extracts section: 'Hello'
singleQuotes.split(', ');           // Splits into array: ['Hello', 'world!']
singleQuotes.substring(0, 5);       // Returns substring: 'Hello'
singleQuotes.toLowerCase();         // Converts to lowercase: 'hello, world!'
singleQuotes.toUpperCase();         // Converts to uppercase: 'HELLO, WORLD!'
singleQuotes.trim();                // Removes whitespace from both ends
```

## Type Coercion

```javascript
// String Coercion
String(123);         // Explicit: '123'
123 + '';            // Implicit: '123'

// Number Coercion
Number('123');       // Explicit: 123
+'123';              // Implicit: 123
parseInt('123', 10); // Parses string to integer: 123
parseFloat('123.45'); // Parses string to float: 123.45

// Boolean Coercion
Boolean(0);          // Explicit: false
!!0;                 // Implicit: false

// Truthy and Falsy Values
// Falsy: false, 0, -0, '', null, undefined, NaN
// Truthy: everything else

// Equality Comparisons
1 == '1';            // true (loose equality with coercion)
1 === '1';           // false (strict equality, no coercion)
```

## Scope and Hoisting

```javascript
// Global Scope
var globalVar = 'I am global';
let globalLet = 'I am also global';
const globalConst = 'I am a global constant';

// Function Scope
function exampleFunction() {
  var functionVar = 'I am function-scoped';
  let functionLet = 'I am also function-scoped';
  const functionConst = 'I am a function-scoped constant';
}

// Block Scope
if (true) {
  var blockVar = 'I leak outside the block!';
  let blockLet = 'I stay inside the block';
  const blockConst = 'I also stay inside the block';
}
console.log(blockVar);    // 'I leak outside the block!'
console.log(blockLet);    // ReferenceError
console.log(blockConst);  // ReferenceError

// Hoisting
console.log(hoistedVar);  // undefined (declaration is hoisted, not initialization)
var hoistedVar = 'I am hoisted';

console.log(notHoisted);  // ReferenceError (let/const are not hoisted the same way)
let notHoisted = 'I am not hoisted';

hoistedFunction();        // Works because function declarations are hoisted completely
function hoistedFunction() {
  console.log('I am a hoisted function');
}

notHoistedFunction();     // TypeError (function expressions are not hoisted)
var notHoistedFunction = function() {
  console.log('I am not a hoisted function');
};
```
