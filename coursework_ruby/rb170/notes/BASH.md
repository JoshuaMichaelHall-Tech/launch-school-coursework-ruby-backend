```cmd
$ echo 'Hello world!'
-> Hello World!

read name #assigns input to new name variable
echo $name #outputs value assigned to name variable

name='Sara'
$ echo $name
-> Sara # the value we earlier assigned to the name variable is output

$ read first second third
Do you like apples?
$ echo $first 
-> # Do
$ echo $second 
-> # you
$ echo $third 
-> # like apples?
```

### BASH Files

```cmd
#Create bash file
touch example.sh

#Make executable
chmod +x example.sh

#Run program
./example.sh

```

```bash
#!/bin/bash

echo 'Hello world!'
```

### Conditional Statements

```bash
if [[ <condition> ]]
then
  <commands>
fi
```

A selection of operators are described below.

**Strings**

|Operator|Description|
|---|---|
|`-n string`|Length of `string` is greater than 0|
|`-z string`|Length of `string` is 0 (`string` is an empty string)|
|`string_1 = string_2`|`string_1` is equal to `string_2`|
|`string_1 != string_2`|`string_1` is not equal to `string_2`|

**Integers**

|Operator|Description|
|---|---|
|`integer_1 -eq integer_2`|`integer_1` is equal to `integer_2`|
|`integer_1 -ne integer_2`|`integer_1` is not equal to `integer_2`|
|`integer_1 -gt integer_2`|`integer_1` is greater than `integer_2`|
|`integer_1 -ge integer_2`|`integer_1` is greater than or equal to `integer_2`|
|`integer_1 -lt integer_2`|`integer_1` is less than `integer_2`|
|`integer_1 -le integer_2`|`integer_1` is less than or equal to `integer_2`|

**Files**

|Operator|Description|
|---|---|
|`-e path/to/file`|`file` exists|
|`-f path/to/file`|`file` exists and is a _regular_ file (not a directory)|
|`-d path/to/file`|`file` exists and is a directory|
### Loops
**while**

```bash
counter=0
max=10

while [[ $counter -le $max ]]
do
  echo $counter
  ((counter++))
done
```

**until**

```bash
counter=0
max=10

until [[ $counter -gt $max ]]
do
  echo $counter
  ((counter++))
done
```

**for**

```bash
numbers='1 2 3 4 5 6 7 8 9 10'

for number in $numbers
do
  echo $number
done
```

### Functions
```bash
greeting () {
  echo "Hello $1"
  echo "Hello $2"
}

greeting 'Peter' 'Paul' # outputs 'Hello Peter' 'Hello Paul' on separate lines
```

`coproc` command is used to set up a coprocess
`cat` command is used to output contents of a file [here](https://www.linfo.org/cat.html)
`echo` command is used to send to STDOUT [here](https://www.linfo.org/echo.html)
  Options
    -n removes default trailing line
     -e enables escape character (backslash)

Single verses Double Quotes
Double required to preserve literal value of each character ($my_var)

Newline
`\r\n` returns at the end of the line
### Array
Implemented as follows
`my_arr=()`

