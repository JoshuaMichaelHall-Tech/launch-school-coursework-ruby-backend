| Method   | Action         | Considers the return value of the block? | Returns a new collection from the method? | Length of the returned collection |
| -------- | -------------- | ---------------------------------------- | ----------------------------------------- | --------------------------------- |
| `each`   | Iteration      | No                                       | No, it returns the original               | Length of original                |
| `select` | Selection      | Yes, its truthiness                      | Yes                                       | Length of original or less        |
| `map`    | Transformation | Yes                                      | Yes                                       | Length of original                |
 