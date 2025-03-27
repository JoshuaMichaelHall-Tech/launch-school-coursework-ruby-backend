# RB100: Programming Foundations with Ruby: Basics - Reference Sheet

## Ruby Control Flow

### Conditionals
```ruby
# If statement
if condition
  # code executed if condition is true
elsif another_condition
  # code executed if another_condition is true
else
  # code executed if all conditions are false
end

# Case statement
case variable
when value1
  # code executed if variable == value1
when value2
  # code executed if variable == value2
else
  # code executed if no conditions match
end
```

### Loops
```ruby
# Basic loop
loop do
  # code to execute repeatedly
  break if condition # exit the loop
end

# While loop
while condition
  # code executed while condition is true
end

# Until loop
until condition
  # code executed until condition is true
end

# For loop
for variable in collection
  # code executed for each item in collection
end
```

### Truthiness
```ruby
# In Ruby, only false and nil are falsy
# Everything else is truthy, including:
if 0       # evaluates as true
  puts "0 is truthy"
end

if ""      # evaluates as true
  puts "Empty string is truthy"
end

if [1, 2]  # evaluates as true
  puts "Arrays are truthy"
end
```

## Bash Commands

### Loop Structures
```bash
#!/bin/bash

# For loop
numbers='1 2 3 4 5 6 7 8 9 10'
for number in $numbers
do
  echo $number
done

# While loop
counter=0
max=10
while [[ $counter -le $max ]]
do
  echo $counter
  ((counter++))
done

# Until loop
counter=0
max=10
until [[ $counter -gt $max ]]
do
  echo $counter
  ((counter++))
done
```

### Functions and Conditionals
```bash
#!/bin/bash

# Function definition
greeting () {
  echo Hello $1
  echo Hello $2
}

# Function call
greeting 'Peter' 'Paul'

# If statement
integer=8
if [[ ! ($integer -lt 5 || $integer -gt 10) ]]
then
  echo $integer is between 5 and 10.
fi
```

### Comparison Operators
```bash
# String comparison
[[ -n string ]]    # True if string is not empty
[[ -z string ]]    # True if string is empty
[[ str1 = str2 ]]  # True if strings are equal
[[ str1 != str2 ]] # True if strings are not equal

# Integer comparison
[[ int1 -eq int2 ]] # Equal to
[[ int1 -ne int2 ]] # Not equal to
[[ int1 -gt int2 ]] # Greater than
[[ int1 -lt int2 ]] # Less than
[[ int1 -ge int2 ]] # Greater than or equal to
[[ int1 -le int2 ]] # Less than or equal to
```
