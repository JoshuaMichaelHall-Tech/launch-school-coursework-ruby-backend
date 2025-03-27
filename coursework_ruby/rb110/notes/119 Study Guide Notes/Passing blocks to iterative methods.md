Questions to ask when evaluating blocks passed to iterative methods:

What specific pieces of information are we interested in keeping track of? When evaluating code like this, ask the following questions:

- What is the type of action being performed (method call, block, conditional, etc..)?
- What is the object that action is being performed on?
- What is the side effect of that action (e.g. output or destructive action)?
- What is the return value of that action?
- Is the return value used by whatever instigated the action?

Charts for Evaluating Blocks Passed to Iterative methods:

| Line | Action                | Object                          | Side-Effect                                 | Return Value                    | Is Return Value Used?                        |
| ---- | --------------------- | ------------------------------- | ------------------------------------------- | ------------------------------- | -------------------------------------------- |
| 1    | method call (`each`)  | The outer array                 | None                                        | The calling object              | No, but shown on line 6                      |
| 1-3  | block execution       | Each sub-array                  | None                                        | `nil`                           | No                                           |
| 2    | method call (`first`) | Each sub-array                  | None                                        | Element at index 0 of sub-array | Yes, used by `puts`                          |
| 2    | method call (`puts`)  | Element at index 0 of sub-array | Outputs string representation of an Integer | `nil`                           | Yes, used to determine return value of block |
