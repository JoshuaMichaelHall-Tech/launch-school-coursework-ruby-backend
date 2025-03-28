# JS225: Object Oriented JavaScript - Reference Sheet

## Objects and Methods

```javascript
// Object Literals
const person = {
  name: 'John',
  age: 30,
  greet() {
    console.log(`Hello, my name is ${this.name}`);
  }
};

// Accessing Properties and Methods
person.name;    // 'John'
person['age'];  // 30
person.greet(); // "Hello, my name is John"

// Adding and Modifying Properties
person.location = 'New York';
person.age = 31;

// Method Borrowing
const anotherPerson = { name: 'Jane' };
person.greet.call(anotherPerson); // "Hello, my name is Jane"

// Property Existence Checking
person.hasOwnProperty('name');       // true
'name' in person;                    // true
Object.hasOwn(person, 'toString');   // false (inherited)
```

## Function Contexts and Objects

```javascript
// Global Context
function globalFunction() {
  console.log(this);
}
globalFunction(); // Window in browsers, global in Node.js

// Method Context
const obj = {
  method() {
    console.log(this);
  }
};
obj.method(); // obj

// Constructor Context
function Constructor() {
  console.log(this);
}
const instance = new Constructor(); // newly created object

// Function Methods for Controlling Context
function greet() {
  console.log(`Hello, ${this.name}`);
}

// call - invoke function with specified this and arguments
greet.call({ name: 'John' }); // "Hello, John"

// apply - like call, but arguments as array
greet.apply({ name: 'John' }, []); // "Hello, John"

// bind - returns a new function with this bound
const greetJohn = greet.bind({ name: 'John' });
greetJohn(); // "Hello, John"

// Arrow Functions and this
const obj2 = {
  name: 'John',
  regularMethod() {
    return function() {
      console.log(this.name); // undefined (global context)
    };
  },
  arrowMethod() {
    return () => {
      console.log(this.name); // "John" (lexical this)
    };
  }
};

obj2.regularMethod()(); // undefined
obj2.arrowMethod()();   // "John"
```

## Closures and Function Scope

```javascript
// Basic Closure
function outer() {
  const outerVar = 'I am from outer';
  
  function inner() {
    console.log(outerVar);
  }
  
  return inner;
}

const closureFn = outer();
closureFn(); // "I am from outer"

// Closure for Private Data
function createCounter() {
  let count = 0;
  
  return {
    increment() {
      count += 1;
      return count;
    },
    decrement() {
      count -= 1;
      return count;
    },
    getValue() {
      return count;
    }
  };
}

const counter = createCounter();
counter.increment(); // 1
counter.increment(); // 2
counter.getValue();  // 2
counter.decrement(); // 1

// Immediately Invoked Function Expression (IIFE)
const result = (function() {
  const private = 'This is private';
  return {
    getPrivate() {
      return private;
    }
  };
})();

result.getPrivate(); // "This is private"

// Partial Function Application
function add(a, b) {
  return a + b;
}

function partial(fn, ...fixedArgs) {
  return function(...remainingArgs) {
    return fn(...fixedArgs, ...remainingArgs);
  };
}

const add5 = partial(add, 5);
add5(10); // 15
```

## Object Creation Patterns

```javascript
// Factory Function Pattern
function createPerson(name, age) {
  return {
    name,
    age,
    greet() {
      console.log(`Hello, my name is ${this.name}`);
    }
  };
}

const john = createPerson('John', 30);
john.greet(); // "Hello, my name is John"

// Constructor Function Pattern
function Person(name, age) {
  this.name = name;
  this.age = age;
}

Person.prototype.greet = function() {
  console.log(`Hello, my name is ${this.name}`);
};

const jane = new Person('Jane', 25);
jane.greet(); // "Hello, my name is Jane"

// Checking Instance Type
jane instanceof Person; // true

// OLOO Pattern (Objects Linking to Other Objects)
const PersonPrototype = {
  init(name, age) {
    this.name = name;
    this.age = age;
    return this;
  },
  greet() {
    console.log(`Hello, my name is ${this.name}`);
  }
};

const jack = Object.create(PersonPrototype).init('Jack', 35);
jack.greet(); // "Hello, my name is Jack"

// Class Syntax (ES6+)
class PersonClass {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
  
  greet() {
    console.log(`Hello, my name is ${this.name}`);
  }
  
  static create(name, age) {
    return new PersonClass(name, age);
  }
}

const emma = new PersonClass('Emma', 28);
emma.greet(); // "Hello, my name is Emma"
```

## Prototypes and Inheritance

```javascript
// Prototype Chain
Object.getPrototypeOf(jane) === Person.prototype; // true
Object.getPrototypeOf(Person.prototype) === Object.prototype; // true

// Inheritance with Constructor Functions
function Employee(name, age, position) {
  Person.call(this, name, age);
  this.position = position;
}

// Setting up the prototype chain
Employee.prototype = Object.create(Person.prototype);
Employee.prototype.constructor = Employee;

// Adding methods to Employee.prototype
Employee.prototype.getPosition = function() {
  return this.position;
};

const employee = new Employee('Tom', 40, 'Manager');
employee.greet();       // "Hello, my name is Tom" (inherited)
employee.getPosition(); // "Manager"

// Checking Inheritance
employee instanceof Employee; // true
employee instanceof Person;   // true
employee instanceof Object;   // true

// Mixin Pattern
const swimmer = {
  swim() {
    console.log(`${this.name} is swimming`);
  }
};

const flyer = {
  fly() {
    console.log(`${this.name} is flying`);
  }
};

function assignMixins(target, ...mixins) {
  Object.assign(target.prototype, ...mixins);
}

function Bird(name) {
  this.name = name;
}

assignMixins(Bird, flyer, swimmer);

const bird = new Bird('Sparrow');
bird.fly();  // "Sparrow is flying"
bird.swim(); // "Sparrow is swimming"
```

## Object Methods and Features

```javascript
// Object.create
const parent = { a: 1 };
const child = Object.create(parent);
child.b = 2;

child.a; // 1 (inherited)
child.b; // 2 (own property)

// Object.assign
const target = { a: 1, b: 2 };
const source = { b: 3, c: 4 };
const result = Object.assign(target, source);
// target and result are now { a: 1, b: 3, c: 4 }

// Object.defineProperty
const obj = {};
Object.defineProperty(obj, 'readOnly', {
  value: 42,
  writable: false,
  enumerable: true,
  configurable: false
});

obj.readOnly = 100; // Silently fails in non-strict mode
obj.readOnly;       // 42

// Object.keys, values, entries
const sample = { a: 1, b: 2, c: 3 };
Object.keys(sample);    // ['a', 'b', 'c']
Object.values(sample);  // [1, 2, 3]
Object.entries(sample); // [['a', 1], ['b', 2], ['c', 3]]

// Object Property Descriptors
const descriptor = Object.getOwnPropertyDescriptor(sample, 'a');
// { value: 1, writable: true, enumerable: true, configurable: true }

// Object Freezing and Sealing
const frozen = Object.freeze({ x: 1, y: 2 });
frozen.x = 100; // Silently fails in non-strict mode
frozen.x;       // 1

const sealed = Object.seal({ x: 1, y: 2 });
sealed.x = 100; // Works because properties are writable
sealed.z = 3;   // Silently fails in non-strict mode
```

## Advanced Context and Binding

```javascript
// Context Loss Problem #1: Method Extracted and Used as Function
const obj = {
  name: 'My Object',
  getName() {
    return this.name;
  }
};

const extractedGetName = obj.getName;
extractedGetName(); // undefined (this is the global object)

// Solution: Bind the method
const boundGetName = obj.getName.bind(obj);
boundGetName(); // "My Object"

// Context Loss Problem #2: Internal Function in a Method
const obj2 = {
  name: 'My Object',
  printInfoWithHelper() {
    function helper() {
      console.log(this.name); // undefined (this is the global object)
    }
    helper();
  }
};

// Solution 1: Use a variable in closure
const obj3 = {
  name: 'My Object',
  printInfoWithHelper() {
    const self = this;
    function helper() {
      console.log(self.name); // "My Object"
    }
    helper();
  }
};

// Solution 2: Use bind
const obj4 = {
  name: 'My Object',
  printInfoWithHelper() {
    function helper() {
      console.log(this.name);
    }
    helper.bind(this)(); // "My Object"
  }
};

// Solution 3: Use an arrow function
const obj5 = {
  name: 'My Object',
  printInfoWithHelper() {
    const helper = () => {
      console.log(this.name); // "My Object"
    };
    helper();
  }
};

// Context Loss Problem #3: Function as Argument
function invokeCallback(callback) {
  callback();
}

const obj6 = {
  name: 'My Object',
  processWithCallback() {
    invokeCallback(function() {
      console.log(this.name); // undefined (this is the global object)
    });
  }
};

// Solution: Use bind
const obj7 = {
  name: 'My Object',
  processWithCallback() {
    invokeCallback(function() {
      console.log(this.name);
    }.bind(this)); // "My Object"
  }
};
```
