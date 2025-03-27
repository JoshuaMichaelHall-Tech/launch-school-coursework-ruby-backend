# TypeScript Glossary

## Core Concepts

| Term | Definition |
|------|------------|
| TypeScript | A strongly typed programming language that builds on JavaScript, adding static type definitions to enhance code quality and understandability. |
| Type System | The set of rules that assigns types to variables, expressions, and functions in TypeScript. |
| Type Annotation | Explicit syntax to define the type of a variable, parameter, or return value (e.g., `let age: number`). |
| Type Inference | TypeScript's ability to automatically determine types without explicit annotations. |
| Type Safety | The guarantee that operations performed on values are done with compatible types, catching type errors at compile time rather than runtime. |
| Structural Typing | TypeScript's type compatibility is based on structure rather than explicit inheritance or naming, focusing on the shape of objects. |
| Nominal Typing | A type system where compatibility is based on explicit declarations rather than structure (not used in TypeScript). |
| Compiler | The TypeScript compiler (`tsc`) that converts TypeScript code to JavaScript. |
| tsconfig.json | Configuration file that specifies compiler options and project settings for TypeScript. |

## Types

| Term | Definition |
|------|------------|
| Primitive Types | Basic types: `string`, `number`, `boolean`, `undefined`, `null`, `symbol`, and `bigint`. |
| Any | Special type that allows any value and bypasses type checking (`any`). |
| Unknown | Similar to `any` but safer, requiring type checking before operations can be performed. |
| Never | Represents values that never occur (e.g., a function that always throws an exception). |
| Void | Indicates the absence of a value, typically used as a function return type. |
| Array Type | Collection of elements of the same type (e.g., `number[]` or `Array<number>`). |
| Tuple | Array with fixed number of elements of known types (e.g., `[string, number]`). |
| Enum | A way to define a set of named constants (e.g., `enum Color { Red, Green, Blue }`). |
| Interface | A way to define object shapes, can be extended and implemented (e.g., `interface Person { name: string }`). |
| Type Alias | A name for any type, including primitives, unions, and intersections (e.g., `type ID = string | number`). |
| Union Type | Type formed by combining two or more types, representing values that could be any one of those types (e.g., `string \| number`). |
| Intersection Type | Type that combines multiple types into one, requiring all properties from each (e.g., `Person & Employee`). |
| Literal Type | Type representing a specific value (e.g., `"error"` as a string literal type). |
| Index Signature | Syntax for typing objects with dynamic property names (e.g., `{ [key: string]: number }`). |

## Advanced Type Features

| Term | Definition |
|------|------------|
| Generics | Type parameters that allow types to be specified later, enabling reusable components (e.g., `function identity<T>(arg: T): T`). |
| Type Guards | Expressions that perform runtime checks to guarantee type information within a scope. |
| Type Assertion | Way to override TypeScript's inferred type (e.g., `value as string` or `<string>value`). |
| Type Narrowing | Process of refining types to more specific types through conditionals, assignments, or type guards. |
| Discriminated Union | Pattern using a common property with literal types to distinguish between union members. |
| Mapped Types | Ways to create new types based on old ones by mapping over property types (e.g., `{ [K in keyof T]: boolean }`). |
| Conditional Types | Types that act like if statements in the type system (e.g., `T extends U ? X : Y`). |
| Utility Types | Built-in types like `Partial<T>`, `Required<T>`, `Pick<T, K>`, etc., for common type transformations. |
| Type Parameters | Generic type variables defined by a generic type or function (e.g., the `T` in `Array<T>`). |
| keyof Operator | Returns a union of all property names of a type as string literals. |
| typeof Operator | When used in type context, refers to the type of a variable or property. |
| Declaration Files | Files with `.d.ts` extension that provide type information for JavaScript libraries. |
| Ambient Declaration | Type declarations for entities not defined in the current project (e.g., third-party libraries). |

## TypeScript and JavaScript Interoperability

| Term | Definition |
|------|------------|
| Declaration Merging | TypeScript's ability to merge multiple declarations with the same name. |
| Type Definition Files | Files with `.d.ts` extension providing type information for JavaScript code. |
| DefinitelyTyped | A repository of type definitions for JavaScript libraries (`@types` packages). |
| JSDoc Comments | Documentation comments in JavaScript that TypeScript can use for type information. |
| Gradual Typing | The ability to incrementally add types to JavaScript code. |
| Downleveling | The process of converting newer JavaScript features to older versions for compatibility. |
| Strict Mode | TypeScript compiler option for enabling stricter type checking rules. |
