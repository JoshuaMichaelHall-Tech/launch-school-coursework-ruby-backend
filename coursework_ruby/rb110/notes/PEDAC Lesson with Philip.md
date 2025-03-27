3/21/2024

```ruby
=begin

Given a collection of integers, write a method to return a new collection of every unique contiguous subarray in that collection with an even sum. The returned subarrays can be in any order.

  

even_subs([1, 1, 1, 1, 1]).sort == [[1, 1], [1, 1, 1, 1]]

even_subs([1, 2, 3, 4, 5]).sort == [[2], [4]]

even_subs([88, 54, 67, 56, 36]).sort == [[36], [54], [56], [56, 36], [88], [88, 54]]

=end

  
  
  

=begin  

- NOT adding up the sum of all the elements

-

Rules:

  - Choose the greatest of consecutive odd / even sum

=end

=begin

P - Understanding the Problem:

- Goal: understand what you're being asked to do

  - Read the problem description

  - Identify expected input and output

  - Establish rules/requirements/define the boundaries of the problem

  - Ask clarifying questions

  - Take your time on this step!

  

E - Examples and Test Cases:

- Goal: further expand and clarify understanding about what you're being asked to do

  - Use examples/test cases to confirm or refute assumptions made about the problem in the previous step

  

D - Data Structures:

- Goal: begin to think logically about the problem

  - What data structures could we use to solve this problem?

    - What does our data look like when we get it? (input)

    - What does our data look like when we return it? (output?)

    - What does our data need to look like in the intermediate steps?

  

consecutive_sum([88, 54, 67, 56, 36]) == 142

  

input: array of integers

intermediate: an array of all possible subarrays formed from the input.

    - select out only those with consecutive odds/evens

    - reduce to an array of sums of these subarrays

  - start by getting consecutive odd/even subarrays

    - then get sums and return output

output: one integer

  
  

A - Algorithm:

- Goal: write out steps to solve the given problem in plain English

  - A logical sequence of steps for accomplishing a task/objective

  - Start high level, but make sure you've thought through and have provided sufficient detail for working through the most difficult parts of the problem

  - Stay programming-language-agnostic

  - Can create substeps for different parts or separate concerns into a helper method

  - You can (and should) revisit your algorithm during the implementation stage if you need to refine your logic

  - Before moving onto implementing the algorithm, check it against a few test cases

  

highest-level

find the consecutive odd/even subarray with the largest sum, return that sum

  

consecutive_sum([1, 1, 1, 1, 1]) == 5

consecutive_sum([1, 2, 3, 4, 5]) == 5

consecutive_sum([88, 54, 67, 56, 36]) == 142

  

- find some consecutive odd/even subarrays

  - do I need to find all of them?

    - so if we only have positive ints, the largest subarray with a given element will always be the one we want

  - iterate over all the array elements

  - starting at the 0th index, compare its evenness (% 2 == ?) to the previous element.

        - need to account for 0th index specifically. If the index is 0, treat it as the same evenness

        - if the index is the length of the array, treat it as different evenness, add it to the subarray of totals, and stop

    - if it's the same evenness, sum it to a running total (starting at 0)

    - if it's a different evenness, send the running total to a subarray of totals and start a new running total (at the current element)

- return the greatest sum

  
  
  

C - Implementing a Solution in Code:

- Goal: translate the algorithm into your programming language of choice

  - Code with intent. Avoid hack and slash

- TEST FREQUENTLY

  - Use the REPL or run your code as a file

  - When testing your code, always have an idea in place of what you're expecting

  - If you find that your algorithm doesn't work, return there FIRST if needed and THEN fix your code

=end
```


```ruby
=begin

Given a collection of integers, write a method to return a new collection of every unique contiguous subarray in that collection with an even sum. The returned subarrays can be in any order.

  

even_subs([1, 1, 1, 1, 1]).sort == [[1, 1], [1, 1, 1, 1]]

even_subs([1, 2, 3, 4, 5]).sort == [[1, 2, 3], [1, 2, 3, 4], [2], [2, 3, 4, 5], [3, 4, 5], [4]]

even_subs([88, 54, 67, 56, 36]).sort == [[36], [54], [56], [56, 36], [88], [88, 54]]

=end

  

=begin

Questions:

  - What is a contiguos subarray?

  - Are all integers positive, non-zero numbers?

Expected Input

  - An array of integers

  

Expected Output

  - An array of arrays

  

Rules/Requirements

  - Every consecutive set of array values must be evaluated

  - Every qualifying subarray must be included in the resulting Array

  - Only consecutive elements added together returning a positive number should be included in the returned Array

  

Examples/Test Cases

  - Confirmed that we are only working with non-zero positive integer inputs

  - Confirmed that contiguous subarray means a set of numbers next to each other in the input Array

  

Data Structures

  - Input array to be evaluated

  - Intermediate array to hold all combinations of consecutive numbers in the input array

  - Array to hold qualifying subarrays and to be returned by the method

  

Algorithm

  - Iterate over the input array to find all unique contiguous subarrays and place them in a new Array

    -

  - Iterate over the new array to find all qualifying (even sums) subarrays and place them in the final, return array

  

=end

  
  

=begin

Jack

P

  Input: Array of Integers

  Output: A new Array of subarrays

          Each subarray are consectuive elements from input that return an even sum

  Description: Take an Array of Integers and

  return a 2D Array of each consecutive string of elements from input that return an even sum.

  

  Requirements:

    - No specific order for subarrays

    - The sum of consecutive elements has to return an even Integer

  

DS

  Input: Array of Ints

  Integer: Hold a running total

  Array: To get the 'slicing' of elements to add to the output

  Intermediate: A Array to hold consecutive Integers that have an even sum which can be placed into the output

  Output: Array of Arrays

  

ALGO:

  - GO over each element in input

    - If element is even, STORE it as a 1 element Array

  - GO over each element in input again

    - IF previous elements summed with current element is even THEN STORE an array of all the previous elements

    - ELSE

  

  - RETURN 2D Array with stored elements

=end

  

=begin

Udeshika

  

P:

-input - array of integers

- output  - subarray of unique subarray that return even sum only

- should return all the subarrays that gives even sum by adding consecutive elements

- in the result subarrays should be unique

  

E:

even_subs([1, 1, 1, 1, 1]).sort == [[1, 1], [1, 1, 1, 1]]

---> 1+1 -->2 --> [1,1] , then 1+1+1+= 4 --> [1,1,1,1] those two sub arrays return as output

even_subs([1, 2, 3, 4, 5]).sort == [[1, 2, 3], [1, 2, 3, 4], [2], [2, 3, 4, 5], [3, 4, 5], [4]]

--->

even_subs([88, 54, 67, 56, 36]).sort == [[36], [54], [56], [56, 36], [88], [88, 54]]

---> [88],[54], [56], [36], [88,54], [56,36],

  
  

D:

 - input - array

 - array of sub arrays which are giving even sums with consecuitve elements

  

A:

 - create variables  sub_arr and even_sub_arr

 - Iterate thorough array to get all the possible sub array combinantions ??

[1, 2, 3, 4, 5]

  1

  1, 2

  1, 2, 3....

  1, 2, 3, 4, 5

  2,

  2, 3

  

  Iterate through the array and each element is going to be the starting element of a set of subarrays

    - for each element, iterate through the same array starting at the index and going to the end

      - get slices of the array from a start point to an end point ([start..end])

        - start point is the outer index, end point is the inner index

  
  

  - use sub_arr to get all possible combinations

 - check all the sum of the elements of all sub arrays

    - if the sum of the elemnts of subarray is even push to a even_sub_arr

    otherwise keep same even_sub_arr

    -

  
  

C:

  

def even_subs(arr)

  sub_arr = []

  even_sub_arr = []

  arr.each_with_index do |element. idx|

  end

  
  

end

=end

  

=begin

Will

Collection of integers: Array of ints (no nested arrays)

Should return an array of arrays. Each nested array should be an array of elements from the argument array.

Contiguous subarray? Any subarray whose indices form an unbroken range.

  

Addendum: Returned array should only contain UNIQUE subarrays.

  

What happens if argument array is empty?

Negatives and Zeroes should not make a difference

  

Need to create an an array of all subarrays of argument.

Need to instantiate an even_sums array

Need to add subarrays to even_sums if they reduce to an even sum

  

take argument array and create an array of all subarrays (all_subarrays)

take all_subarrays and select only ones which reduce to a positive sum

store result of selection in even_sums array

  

making subarrays:

iterate i from 0 to last_index

  iterate j from i to last_index

    create array from i to j

    store array in all_subarrays

  
  
  

Program:

def even_subs(arr)

  even_sums = []

  all_subarrays = create_all_subarrays(arr)

  all_subarrays.each do |subarray|

    curr_sub_sum = 0

    subarray.each do |element|

      curr_sub_sum += element

    end

    even_sums << subarray if curr_sub_sum.even?

  end

  even_sums.uniq

end

  
  

def create_all_subarrays(arr)

  all_subs = []

  (0...arr.size).each do |start_element|

    (start_element...arr.size).each do |end_element|

      all_subs << arr[start_element..end_element]

    end

  end

  all_subs

end

  

=end

  
  

even_sums = all_subarrays.select do |subarray|

  subarray.sum.even?

end
```