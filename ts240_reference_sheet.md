# TypeScript Reference Sheet

## Installation and Setup

```bash
# Install TypeScript globally
npm install -g typescript

# Check TypeScript version
tsc --version

# Initialize a new TypeScript project (creates tsconfig.json)
tsc --init

# Compile a TypeScript file
tsc filename.ts

# Compile with watch mode (automatically recompile on changes)
tsc --watch filename.ts

# Compile project according to tsconfig.json
tsc
```

## tsconfig.json Options

```json
{
  "compilerOptions": {
    // Basic Options
    "target": "es2016",             // Specify ECMAScript target version
    "module": "commonjs",           // Specify module code generation
    "lib": ["dom", "es2016"],       // Specify library files to include
    "outDir": "./dist",             // Redirect output to directory
    "rootDir": "./src",             // Specify the root directory of input files
    
    // Strict Type-Checking Options
    "strict": true,                 // Enable all strict type-checking options
    "noImplicitAny": true,          // Error on expressions and declarations with implied 'any' type
    "strictNullChecks": true,       // Enable strict null checks
    
    // Additional Checks
    "noUnusedLocals": true,         // Report errors on unused locals
    "noUnusedParameters": true,     // Report errors on unused parameters
    
    // Module Resolution Options
    "esModuleInterop": true,        // Enable interoperability between CommonJS and ES Modules
    "moduleResolution": "node",     // Specify module resolution strategy
    
    // Source Map Options
    "sourceMap": true,              // Generates corresponding .map file
    
    // Advanced Options
    "skipLibCheck": true,           // Skip type checking of declaration files
    "forceConsistentCasingInFileNames": true // Ensure file names are consistent in casing
  },
  "include": ["src/**/*"],          // Files to include
  "exclude": ["node_modules", "**/*.spec.ts"] // Files to exclude
}
```

## Type Annotations

```typescript
// Primitive types
let isDone: boolean = false;
let decimal: number = 6;
let color: string = "blue";
let big: bigint = 100n;
let sym: symbol = Symbol("name");

// Arrays
let list: number[] = [1, 2, 3];
let genericList: Array<number> = [1, 2, 3];

// Tuples
let tuple: [string, number] = ["hello", 10];

// Enum
enum Color {
  Red,
  Green,
  Blue
}
let c: Color = Color.Green;  // 1

// Unknown
let notSure: unknown = 4;

// Any (avoid when possible)
let loosely: any = 4;

// Void
function warnUser(): void {
  console.log("Warning!");
}

// Null and Undefined
let u: undefined = undefined;
let n: null = null;

// Never
function error(message: string): never {
  throw new Error(message);
}

// Object
let obj: object = {};

// Function
let myFunc: (x: number, y: number) => number;
myFunc = (x, y) => x + y;
```

## Interfaces and Type Aliases

```typescript
// Interface
interface User {
  id: number;
  name: string;
  email?: string;  // Optional property
  readonly createdAt: Date;  // Read-only property
}

// Extending interfaces
interface Employee extends User {
  department: string;
}

// Implementing interfaces
class Manager implements Employee {
  id: number;
  name: string;
  createdAt: Date;
  department: string;

  constructor(id: number, name: string, department: string) {
    this.id = id;
    this.name = name;
    this.createdAt = new Date();
    this.department = department;
  }
}

// Type alias
type ID = string | number;
type Point = { x: number; y: number };

// Intersection types
type AdminUser = User & { privileges: string[] };
```

## Classes

```typescript
class Animal {
  // Property
  private name: string;
  
  // Constructor
  constructor(name: string) {
    this.name = name;
  }
  
  // Method
  public move(distance: number = 0): void {
    console.log(`${this.name} moved ${distance}m.`);
  }
  
  // Getter
  get animalName(): string {
    return this.name;
  }
  
  // Setter
  set animalName(name: string) {
    this.name = name;
  }
}

// Inheritance
class Dog extends Animal {
  constructor(name: string) {
    super(name);
  }
  
  // Method override
  public move(distance: number = 5): void {
    console.log("Running...");
    super.move(distance);
  }
  
  // Static method
  static createDog(name: string): Dog {
    return new Dog(name);
  }
}

// Abstract class
abstract class Shape {
  abstract getArea(): number;
  
  printArea(): void {
    console.log(this.getArea());
  }
}

// Implementing abstract class
class Circle extends Shape {
  constructor(private radius: number) {
    super();
  }
  
  getArea(): number {
    return Math.PI * this.radius ** 2;
  }
}
```

## Generics

```typescript
// Generic function
function identity<T>(arg: T): T {
  return arg;
}
let output = identity<string>("myString");

// Generic interface
interface GenericResponse<T> {
  data: T;
  status: number;
  message: string;
}

// Generic class
class Queue<T> {
  private data: T[] = [];
  
  push(item: T): void {
    this.data.push(item);
  }
  
  pop(): T | undefined {
    return this.data.shift();
  }
}

// Generic constraints
interface Lengthwise {
  length: number;
}

function loggingIdentity<T extends Lengthwise>(arg: T): T {
  console.log(arg.length);  // Now we know arg has a .length property
  return arg;
}

// Generic parameter defaults
interface API<T = any> {
  endpoint: string;
  fetch(): Promise<T>;
}
```

## Type Guards and Type Narrowing

```typescript
// typeof type guard
function padLeft(value: string, padding: string | number) {
  if (typeof padding === "number") {
    // padding is now known to be of type number
    return Array(padding + 1).join(" ") + value;
  }
  // padding is now known to be of type string
  return padding + value;
}

// instanceof type guard
class Bird {
  fly() {
    console.log("flying...");
  }
}

class Fish {
  swim() {
    console.log("swimming...");
  }
}

function move(animal: Bird | Fish) {
  if (animal instanceof Bird) {
    // animal is now known to be of type Bird
    animal.fly();
  } else {
    // animal is now known to be of type Fish
    animal.swim();
  }
}

// User-defined type guard
interface Cat { meow(): void }
interface Dog { bark(): void }

function isCat(animal: Cat | Dog): animal is Cat {
  return (animal as Cat).meow !== undefined;
}

function makeSound(animal: Cat | Dog) {
  if (isCat(animal)) {
    // animal is now known to be of type Cat
    animal.meow();
  } else {
    // animal is now known to be of type Dog
    animal.bark();
  }
}

// Discriminated unions
interface Square {
  kind: "square";
  size: number;
}

interface Rectangle {
  kind: "rectangle";
  width: number;
  height: number;
}

type Shape = Square | Rectangle;

function calculateArea(shape: Shape) {
  switch (shape.kind) {
    case "square":
      // shape is now known to be of type Square
      return shape.size * shape.size;
    case "rectangle":
      // shape is now known to be of type Rectangle
      return shape.width * shape.height;
  }
}
```

## Utility Types

```typescript
// Partial - Makes all properties optional
interface Todo {
  title: string;
  description: string;
  completed: boolean;
}

function updateTodo(todo: Todo, fieldsToUpdate: Partial<Todo>): Todo {
  return { ...todo, ...fieldsToUpdate };
}

// Required - Makes all properties required
type RequiredTodo = Required<Todo>;

// Readonly - Makes all properties readonly
const todo: Readonly<Todo> = {
  title: "Learn TypeScript",
  description: "Study advanced types",
  completed: false
};

// Record - Creates a type with specific key and value types
type PageInfo = { title: string };
type Page = "home" | "about" | "contact";

const pages: Record<Page, PageInfo> = {
  home: { title: "Home" },
  about: { title: "About" },
  contact: { title: "Contact" }
};

// Pick - Picks a subset of properties
type TodoPreview = Pick<Todo, "title" | "completed">;

// Omit - Omits a subset of properties
type TodoShort = Omit<Todo, "description">;

// Exclude - Excludes types from a union
type T0 = Exclude<"a" | "b" | "c", "a">;  // "b" | "c"

// Extract - Extracts types from a union
type T1 = Extract<"a" | "b" | "c", "a" | "f">;  // "a"

// NonNullable - Removes null and undefined from a type
type T2 = NonNullable<string | number | undefined>;  // string | number

// ReturnType - Gets the return type of a function
function f() { return { a: 1, b: 2 }; }
type T3 = ReturnType<typeof f>;  // { a: number, b: number }

// Parameters - Gets the parameter types of a function
type T4 = Parameters<(a: string, b: number) => void>;  // [string, number]
```

## Declaration Files

```typescript
// Example .d.ts file (used to provide type information for JavaScript libraries)

// MyLibrary.d.ts
declare namespace MyLibrary {
  function makeGreeting(name: string): string;
  let numberOfGreetings: number;
}

// Using the library
let result = MyLibrary.makeGreeting("John");  // string
let count = MyLibrary.numberOfGreetings;      // number
```

## JSDoc Type Annotations for JavaScript

```javascript
// Using JSDoc for TypeScript type checking in JavaScript files

/**
 * @param {string} name - The name of the person
 * @param {number} [age] - The age of the person (optional)
 * @returns {string} A greeting message
 */
function greet(name, age) {
  if (age !== undefined) {
    return `Hello, ${name}! You are ${age} years old.`;
  }
  return `Hello, ${name}!`;
}
```
