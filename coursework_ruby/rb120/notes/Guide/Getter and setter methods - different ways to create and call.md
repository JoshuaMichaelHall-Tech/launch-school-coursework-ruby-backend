# Getter
### Definition
A getter's only job is to return the value in an instance variable.

### Implementation
Should use the same parameter name as the instance variable name to which it will be assigned.

### Benefits


### Code Snippets

```ruby
attr_reader :name

#or

def name
  @name
end
```

```ruby
def speak
  "#{name} says arf!"
end
```

Can you spot the change? By removing the `@` symbol, we're now calling the instance method, rather than the instance variable.

----

# Setter
### Definition
A setter's only job is to set the value of an instance variable.

### Implementation
Should use the same parameter name as the instance variable name to which it will be assigned.

### Benefits


### Code Snippets


```ruby
attr_writer :name

#or

def name=(name)
  @name = name
end

attr_accessor :name # Combines attr_reader and attr_writer
```