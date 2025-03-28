# TypeScript Study Guide

## Introduction to TypeScript

### What is TypeScript?
TypeScript is a strongly typed programming language that builds on JavaScript, adding static type checking and other features to enhance code quality, maintainability, and developer productivity. It's developed and maintained by Microsoft.

### Why Use TypeScript?
- **Type Safety**: Catch errors during development rather than runtime
- **Better IDE Support**: Enhanced autocompletion, navigation, and refactoring
- **Self-Documenting Code**: Types serve as documentation
- **Safer Refactoring**: Types help ensure changes don't break existing functionality
- **Enhanced Collaboration**: Types provide contracts between different parts of code

### TypeScript vs. JavaScript
- TypeScript is a superset of JavaScript (all valid JavaScript is valid TypeScript)
- TypeScript adds static typing to JavaScript
- TypeScript code compiles down to JavaScript
- TypeScript catches errors at compile time that JavaScript would catch at runtime

## TypeScript Fundamentals

### Basic Types
Make sure you understand how to use and when to use each:
- **Primitive Types**: `string`, `number`, `boolean`, `null`, `undefined`, `symbol`, `bigint`
- **Arrays**: `string[]`, `Array<number>`
- **Tuples**: `[string, number]`
- **Enums**: `enum Direction { North, South, East, West }`
- **Any**: `any` (avoid when possible)
- **Unknown**: `unknown` (type-safe alternative to `any`)
- **Void**: `void` (absence of a value, typically used for function returns)
- **Never**: `never` (values that never occur)
- **Object**: `object` or `{ prop: string }`

### Type Annotations and Inference
- **Type Annotations**: Explicitly telling TypeScript what type something is
  ```typescript
  let name: string = "John";
  function greet(person: string): string {
    return `Hello, ${person}!`;
  }
  ```
- **Type Inference**: TypeScript guesses the type based on value
  ```typescript
  let name = "John"; // TypeScript infers string
  ```

### Interfaces
```typescript
interface Person {
  firstName: string;
  lastName: string;
  age?: number; // Optional property
  readonly id: number; // Read-only property
}
```

- Interfaces define contracts for object shapes
- Can be extended: `interface Employee extends Person { ... }`
- Can be implemented by classes: `class Manager implements Employee { ... }`
- Can have optional properties with `?`
- Can have readonly properties with `readonly`

### Type Aliases
```typescript
type Point = {
  x: number;
  y: number;
};

type ID = string | number;
```

- Define names for types, including primitives, unions, intersections, etc.
- Cannot be extended or implemented like interfaces

### Union and Intersection Types
```typescript
// Union type (OR)
type ID = string | number;

// Intersection type (AND)
type Employee = Person & { department: string };
```

- **Union Types**: Value can be one of several types (`A | B`)
- **Intersection Types**: Value has all properties of constituent types (`A & B`)

### Functions
```typescript
// Function with parameters and return type
function add(a: number, b: number): number {
  return a + b;
}

// Optional parameters
function greet(name: string, greeting?: string): string {
  return `${greeting || 'Hello'}, ${name}!`;
}

// Default parameters
function createPoint(x = 0, y = 0): Point {
  return { x, y };
}

// Rest parameters
function sum(...numbers: number[]): number {
  return numbers.reduce((prev, curr) => prev + curr, 0);
}

// Function types
let mathOperation: (a: number, b: number) => number;
mathOperation = add;
```

### Classes
```typescript
class Animal {
  // Properties
  private name: string;
  
  // Constructor
  constructor(name: string) {
    this.name = name;
  }
  
  // Methods
  public makeSound(): void {
    console.log("Some generic sound");
  }
}

// Inheritance
class Dog extends Animal {
  constructor(name: string) {
    super(name);
  }
  
  makeSound(): void {
    console.log("Woof!");
  }
}
```

Key concepts:
- **Access Modifiers**: `public`, `private`, `protected`
- **Inheritance**: `extends` keyword
- **Method Overriding**: Child class can override parent methods
- **Abstract Classes**: `abstract class` with `abstract` methods
- **Static Members**: `static` properties and methods

## Advanced TypeScript Features

### Generics
```typescript
// Generic function
function identity<T>(arg: T): T {
  return arg;
}

// Generic interface
interface Repository<T> {
  getById(id: number): T;
  getAll(): T[];
}

// Generic class
class Stack<T> {
  private items: T[] = [];
  
  push(item: T): void {
    this.items.push(item);
  }
  
  pop(): T | undefined {
    return this.items.pop();
  }
}
```

Key concepts:
- Allows creating reusable components that can work with various types
- Preserves type information
- Can have constraints: `<T extends SomeType>`
- Can have multiple type parameters: `<T, U>`

### Type Guards and Type Narrowing
```typescript
// typeof type guard
function padLeft(value: string, padding: string | number) {
  if (typeof padding === "number") {
    // padding is narrowed to number type
    return " ".repeat(padding) + value;
  }
  // padding is narrowed to string type
  return padding + value;
}

// instanceof type guard
if (pet instanceof Fish) {
  pet.swim();
} else {
  pet.fly();
}

// User-defined type guard
function isFish(pet: Fish | Bird): pet is Fish {
  return (pet as Fish).swim !== undefined;
}
```

Understand different type guards:
- `typeof` for primitive types
- `instanceof` for class instances
- Property checks
- User-defined type guards with `is` keyword
- Discriminated unions with literal types

### Literal Types
```typescript
// String literal types
type Direction = "North" | "South" | "East" | "West";

// Numeric literal types
type DiceRoll = 1 | 2 | 3 | 4 | 5 | 6;
```

- More specific subtypes of general types
- Often used with union types to create a finite set of allowed values

### Mapped Types
```typescript
type Readonly<T> = {
  readonly [P in keyof T]: T[P];
};

type Optional<T> = {
  [P in keyof T]?: T[P];
};

type Nullable<T> = {
  [P in keyof T]: T[P] | null;
};
```

- Transform properties in an existing type
- Based on the `keyof` operator and indexing into the original type

### Conditional Types
```typescript
type ExtractType<T> = T extends string ? "string" : "other";

type NumberOrString<T extends number | string> = 
  T extends number ? "number" : "string";
```

- Create types that depend on conditions
- Often used with generics
- Use the syntax `T extends U ? X : Y`

### Utility Types
Understand built-in utility types:
- `Partial<T>`: Makes all properties optional
- `Required<T>`: Makes all properties required
- `Readonly<T>`: Makes all properties readonly
- `Record<K, T>`: Creates a type with keys of type K and values of type T
- `Pick<T, K>`: Picks a subset of properties from T
- `Omit<T, K>`: Omits a subset of properties from T
- `Exclude<T, U>`: Excludes types from T that are assignable to U
- `Extract<T, U>`: Extracts types from T that are assignable to U
- `NonNullable<T>`: Removes `null` and `undefined` from T
- `ReturnType<T>`: Gets the return type of a function
- `Parameters<T>`: Gets the parameter types of a function

## TypeScript Configuration and Tools

### tsconfig.json
Understand key compiler options:
- `target`: ECMAScript target version
- `module`: Module system 
- `strict`: Enable all strict type checking options
- `outDir`: Output directory for compiled files
- `rootDir`: Root directory of source files
- `lib`: Specifies library files to include
- `esModuleInterop`: Enables interoperability between CommonJS and ES Modules
- `sourceMap`: Generates source maps for debugging

### Declaration Files (.d.ts)
```typescript
// Example .d.ts file
declare namespace MyLibrary {
  function makeGreeting(name: string): string;
  let numberOfGreetings: number;
}
```

- Provide type information for JavaScript libraries
- Allow TypeScript to understand and check JavaScript code
- Can be written manually or generated with `tsc --declaration`
- Learn how to use `@types` packages from DefinitelyTyped

### Module Systems
Understand different ways to import and export:
```typescript
// ES Modules
export function foo() {}
import { foo } from './foo';

// CommonJS
module.exports = function foo() {};
const foo = require('./foo');

// TypeScript namespace
namespace MyNamespace {
  export function foo() {}
}
```

## TypeScript Best Practices

### Avoid `any` Type
- Use `unknown` instead when type is truly unknown
- Use proper type definitions or generics when possible

### Prefer Interfaces for Public APIs
- Interfaces are generally more extensible
- Use type aliases for unions, intersections, or when you need to rename primitives

### Use Strict Null Checking
- Enable `strictNullChecks` in tsconfig.json
- Handle null and undefined explicitly

### Leverage Type Inference
- Don't add type annotations when TypeScript can infer them correctly
- Use type annotations for function parameters and return types

### Prefer Composition Over Inheritance
- Use interfaces and composition when possible
- Inherit only when there's a true "is-a" relationship

### Use Discriminated Unions for Complex Types
```typescript
type Shape = 
  | { kind: "circle"; radius: number }
  | { kind: "rectangle"; width: number; height: number };

function getArea(shape: Shape): number {
  switch (shape.kind) {
    case "circle":
      return Math.PI * shape.radius ** 2;
    case "rectangle":
      return shape.width * shape.height;
  }
}
```

## Practice Areas

### Converting JavaScript to TypeScript
- Start small, convert file by file
- Understand the `allowJs` compiler option
- Use JSDoc comments in JavaScript for gradual typing

### Type Definition Files for Libraries
- Learn how to read and write declaration files
- Understand ambient declarations
- Practice with the `@types` ecosystem

### TypeScript Design Patterns
- Factory pattern with generics
- Builder pattern with interfaces
- Observer pattern with typed events

### Debugging TypeScript
- Using source maps
- Browser debugging tools
- IDE debugging features

## Final Tips

1. **Practice Regularly**: Work on TypeScript projects to reinforce concepts
2. **Use the TypeScript Playground**: Experiment with code at [typescriptlang.org/play](https://www.typescriptlang.org/play)
3. **Read TypeScript Source Code**: Study well-maintained TypeScript projects
4. **Review Documentation**: The [official docs](https://www.typescriptlang.org/docs/) are excellent
5. **Use Strict Mode**: Enable `strict` in tsconfig.json to enforce best practices
