Introductions
- What is your name?
- Where are you in the course?
- What would you like to cover today?

DISCLAIMER
- I am also a fellow student, not a TA
  - I can only speak from my own experience preparing/taking the exams
  - please correct me if I misspeak
- I cannot disclose specific assessment questions

===== 119 Written =====

Format: 10 questions, 1.75 hrs

This assessment will test your knowledge of RB110 and the Introduction to Programming with Ruby book. It focuses on working with collections in Ruby.

- Different types of collections
- Nested collections
- Referencing specific elements in a collection
- Looping and iterating over collections, including nested collections
- Selection from collections
- Transformation of collections
- Sorting collections
- Passing blocks to iterative methods
- Shallow copy vs. deep copy
- Method chaining

===== 119 Interview =====

Format: live coding, 2 problems, 1 hr

- List of practice problems (be able to solve in <= 25 min)
- List of Small Problems set (be able to solve Medium <= 20 min)
  
Useful resources / tips:
- Codewars problem on THE SPOT wiki: https://fine-ocean-68c.notion.site/RB101-934e6196044d425f9b2f23830ead6534?p=b1b328603eea4cfb9d9dbf39b0033d67&pm=s
- LS article on PEDAC: https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f
- highly recommend attending at least one PEDAC session


  
## Example Problem
p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result

## Example Problem 2
  
Create a method that takes an array of numbers as an argument. For each number, determine how many numbers in the array are smaller than it, and place the answer in an array. Return the resulting array.

 When counting numbers, only count unique values. That is, if a number occurs multiple times in the array, it should only be counted once.

## Example Problem 3

Create a method that takes an array of integers as an argument. The method should return the minimum sum of 5 consecutive numbers in the array. If the array contains fewer than 5 elements, the method should return nil.

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

