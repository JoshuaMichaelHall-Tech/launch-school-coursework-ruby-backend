Arity is the rule regarding the number of arguments one must pass to a block, `proc`, or `lambda`.

- Lenient arity: Ruby doesn't care how many arguments are passed.
- Strict arity: Ruby throws an error if the wrong number of arguments are passed.
- Blocks and Procs have lenient arity.
- Methods and lambdas have strict arity.

#### Example of Method Arity
Methods have strict arity and require that the number of arguments specified be passed in when the method is called.

```ruby
def my_method(arg); end

my_method # Raises 'wrong number of arguments' Argument Error
```


#### Example of Block Arity
Blocks have lenient arity and do not care how many arguments are passed in when they are called.

```ruby
def my_method(&block); end

my_method # Runs with no error!
```
