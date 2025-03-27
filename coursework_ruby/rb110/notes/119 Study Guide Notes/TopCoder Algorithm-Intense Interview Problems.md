## Find the Symmetric Difference

The mathematical term symmetric difference (`△` or `⊕`) of two sets is the set of elements which are in either of the two sets but not in both. For example, for sets `A = {1, 2, 3}` and `B = {2, 3, 4}`, `A △ B = {1, 4}`.

Symmetric difference is a binary operation, which means it operates on only two elements. So to evaluate an expression involving symmetric differences among _three_ elements (`A △ B △ C`), you must complete one operation at a time. Thus, for sets `A` and `B` above, and `C = {2, 3}`, `A △ B △ C = (A △ B) △ C = {1, 4} △ {2, 3} = {1, 2, 3, 4}`.


Create a function that takes two or more arrays and returns an array of their symmetric difference. The returned array must contain only unique values (_no duplicates_).

HINT Use the `*` operator in the parameter to take an unknown set of arguments. Example:

```ruby
def dummy_method(*args)
  arrays = [*args]
end
```

#### Tests

```ruby
p sym([1, 2, 3], [5, 2, 1, 4]) == [3, 4, 5]
p sym([1, 2, 3, 3], [5, 2, 1, 4]) == [3, 4, 5]
p sym([1, 2, 3], [5, 2, 1, 4, 5]) == [3, 4, 5]
p sym([1, 2, 5], [2, 3, 5], [3, 4, 5]) == [1, 4, 5]
p sym([3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3]) == [2, 3, 4, 6, 7]
p sym([3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3], [5, 3, 9, 8], [1]) == [1, 2, 4, 5, 6, 7, 8, 9]
```


https://academy.topcoder.com/freeCodeCamp/coding-interview-prep/algorithms/find-the-symmetric-difference

---
## Inventory Update

Compare and update the inventory stored in a 2D array against a second 2D array of a fresh delivery. Update the current existing inventory item quantities (in `arr1`). If an item cannot be found, add the new item and quantity into the inventory array. The returned inventory array should be in alphabetical order by item.

#### Tests

```ruby
p updateInventory([[21, "Bowling Ball"], [2, "Dirty Sock"], [1, "Hair Pin"], [5, "Microphone"]], [[2, "Hair Pin"], [3, "Half-Eaten Apple"], [67, "Bowling Ball"], [7, "Toothpaste"]]) == [[88, "Bowling Ball"], [2, "Dirty Sock"], [3, "Hair Pin"], [3, "Half-Eaten Apple"], [5, "Microphone"], [7, "Toothpaste"]]

p updateInventory([[21, "Bowling Ball"], [2, "Dirty Sock"], [1, "Hair Pin"], [5, "Microphone"]], []) == [[21, "Bowling Ball"], [2, "Dirty Sock"], [1, "Hair Pin"], [5, "Microphone"]]

p updateInventory([], [[2, "Hair Pin"], [3, "Half-Eaten Apple"], [67, "Bowling Ball"], [7, "Toothpaste"]]) == [[67, "Bowling Ball"], [2, "Hair Pin"], [3, "Half-Eaten Apple"], [7, "Toothpaste"]]

p updateInventory([[0, "Bowling Ball"], [0, "Dirty Sock"], [0, "Hair Pin"], [0, "Microphone"]], [[1, "Hair Pin"], [1, "Half-Eaten Apple"], [1, "Bowling Ball"], [1, "Toothpaste"]]) == [[1, "Bowling Ball"], [0, "Dirty Sock"], [1, "Hair Pin"], [1, "Half-Eaten Apple"], [0, "Microphone"], [1, "Toothpaste"]]
```

https://academy.topcoder.com/freeCodeCamp/coding-interview-prep/algorithms/inventory-update

---
## No Repeats Please

Return the number of total permutations of the provided string that don't have repeated consecutive letters. Assume that all characters in the provided string are each unique.

For example, `aab` should return 2 because it has 6 total permutations (`aab`, `aab`, `aba`, `aba`, `baa`, `baa`), but only 2 of them (`aba` and `aba`) don't have the same letter (in this case `a`) repeating.

HINT: You can use the `Array#permutation` method.
#### Tests

```ruby
p permAlone("aab") == 2
p permAlone("aabb") == 8
p permAlone("abcdefa") == 3600
p permAlone("abfdefa") == 2640
p permAlone("a") == 1
p permAlone("aaab") == 0
p permAlone("aaabb") == 12
p permAlone("zzzzzzzz") == 0
p permAlone("aaa") == 0
```


https://academy.topcoder.com/freeCodeCamp/coding-interview-prep/algorithms/no-repeats-please

---
## Pairwise

Given an array `arr`, find element pairs whose sum equal the second argument `arg` and return the sum of their indices.

You may use multiple pairs that have the same numeric elements but different indices. Each pair should use the lowest possible available indices. Once an element has been used it cannot be reused to pair with another element. For instance, `pairwise([1, 1, 2], 3)` creates a pair `[2, 1]` using the 1 at index 0 rather than the 1 at index 1, because 0+2 < 1+2.

For example `pairwise([7, 9, 11, 13, 15], 20)` returns `6`. The pairs that sum to 20 are `[7, 13]` and `[9, 11]`. We can then write out the array with their indices and values.

|Index|0|1|2|3|4|
|---|---|---|---|---|---|
|Value|7|9|11|13|15|

Below we'll take their corresponding indices and add them.

7 + 13 = 20 → Indices 0 + 3 = 3  
9 + 11 = 20 → Indices 1 + 2 = 3  
3 + 3 = 6 → Return `6`

#### Tests

```ruby
p pairwise([1, 4, 2, 3, 0, 5], 7) == 11
p pairwise([1, 3, 2, 4], 4) == 1
p pairwise([1, 1, 1], 2) == 1
p pairwise([0, 0, 0, 0, 1, 1], 1) == 10
p pairwise([], 100) == 0
```


https://academy.topcoder.com/freeCodeCamp/coding-interview-prep/algorithms/pairwise

---
## Implement Bubble Sort

This is the first of several challenges on sorting algorithms. Given an array of unsorted items, we want to be able to return a sorted array. We will see several different methods to do this and learn some tradeoffs between these different approaches. While most modern languages have built-in sorting methods for operations like this, it is still important to understand some of the common basic approaches and learn how they can be implemented.

Here we will see bubble sort. The bubble sort method starts at the beginning of an unsorted array and 'bubbles up' unsorted values towards the end, iterating through the array until it is completely sorted. It does this by comparing adjacent items and swapping them if they are out of order. The method continues looping through the array until no swaps occur at which point the array is sorted.

This method requires multiple iterations through the array and for average and worst cases has quadratic time complexity. While simple, it is usually impractical in most situations.

**Instructions:** Write a function `bubbleSort` which takes an array of integers as input and returns an array of these integers in sorted order from least to greatest.

#### Rules
`bubbleSort` should be a function.
`bubbleSort` should return a sorted array (least to greatest).
`bubbleSort` should not use the built-in sort() method.

#### Tests

```ruby  
p bubbleSort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92]) == [1, 1, 2, 2, 4, 8, 32, 43, 43, 55, 63, 92, 123, 123, 234, 345, 5643]
```


https://academy.topcoder.com/freeCodeCamp/coding-interview-prep/algorithms/implement-bubble-sort

---
## Implement Selection Sort

Here we will implement selection sort. Selection sort works by selecting the minimum value in a list and swapping it with the first value in the list. It then starts at the second position, selects the smallest value in the remaining list, and swaps it with the second element. It continues iterating through the list and swapping elements until it reaches the end of the list. Now the list is sorted. Selection sort has quadratic time complexity in all cases.

**Instructions**: Write a function `selectionSort` which takes an array of integers as input and returns an array of these integers in sorted order from least to greatest.

#### Rules

`selectionSort` should be a function.
`selectionSort` should return a sorted array (least to greatest).
`selectionSort` should not use the built-in sort() method.
#### Tests

```ruby
p selectionSort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92]) == [1, 1, 2, 2, 4, 8, 32, 43, 43, 55, 63, 92, 123, 123, 234, 345, 5643]
```

https://academy.topcoder.com/freeCodeCamp/coding-interview-prep/algorithms/implement-selection-sort

---
## Implement Insertion Sort

The next sorting method we'll look at is insertion sort. This method works by building up a sorted array at the beginning of the list. It begins the sorted array with the first element. Then it inspects the next element and swaps it backwards into the sorted array until it is in sorted position. It continues iterating through the list and swapping new items backwards into the sorted portion until it reaches the end. This algorithm has quadratic time complexity in the average and worst cases.

**Instructions:** Write a function `insertionSort` which takes an array of integers as input and returns an array of these integers in sorted order from least to greatest.

#### Rules
`insertionSort` should be a function.
`insertionSort` should return a sorted array (least to greatest).
`insertionSort` should not use the built-in `.sort()` method.
#### Tests

```ruby
p insertionSort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92]) == [1, 1, 2, 2, 4, 8, 32, 43, 43, 55, 63, 92, 123, 123, 234, 345, 5643]
```

https://academy.topcoder.com/freeCodeCamp/coding-interview-prep/algorithms/implement-insertion-sort

---
## Implement Quick Sort

Here we will move on to an intermediate sorting algorithm: quick sort. Quick sort is an efficient, recursive divide-and-conquer approach to sorting an array. In this method, a pivot value is chosen in the original array. The array is then partitioned into two subarrays of values less than and greater than the pivot value. We then combine the result of recursively calling the quick sort algorithm on both sub-arrays. This continues until the base case of an empty or single-item array is reached, which we return. The unwinding of the recursive calls return us the sorted array.

Quick sort is a very efficient sorting method, providing _O(nlog(n))_ performance on average. It is also relatively easy to implement. These attributes make it a popular and useful sorting method.

**Instructions:** Write a function `quickSort` which takes an array of integers as input and returns an array of these integers in sorted order from least to greatest. While the choice of the pivot value is important, any pivot will do for our purposes here. For simplicity, the first or last element could be used.

#### Rules
`quickSort` should be a function.
`quickSort` should return a sorted array (least to greatest).
`quickSort` should not use the built-in sort() method.

#### Tests

```ruby
p quickSort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92]) == [1, 1, 2, 2, 4, 8, 32, 43, 43, 55, 63, 92, 123, 123, 234, 345, 5643]
```

https://academy.topcoder.com/freeCodeCamp/coding-interview-prep/algorithms/implement-quick-sort

---
## Implement Merge Sort

Another common intermediate sorting algorithm is merge sort. Like quick sort, merge sort also uses a divide-and-conquer, recursive methodology to sort an array. It takes advantage of the fact that it is relatively easy to sort two arrays as long as each is sorted in the first place. But we'll start with only one array as input, so how do we get to two sorted arrays from that? Well, we can recursively divide the original input in two until we reach the base case of an array with one item. A single-item array is naturally sorted, so then we can start combining. This combination will unwind the recursive calls that split the original array, eventually producing a final sorted array of all the elements. The steps of merge sort, then, are:

**1)** Recursively split the input array in half until a sub-array with only one element is produced.

**2)** Merge each sorted sub-array together to produce the final sorted array.

Merge sort is an efficient sorting method, with time complexity of _O(nlog(n))_. This algorithm is popular because it is performant and relatively easy to implement.

**Instructions:** Write a function `mergeSort` which takes an array of integers as input and returns an array of these integers in sorted order from least to greatest. A good way to implement this is to write one function, for instance `merge`, which is responsible for merging two sorted arrays, and another function, for instance `mergeSort`, which is responsible for the recursion that produces single-item arrays to feed into merge. Good luck!

https://academy.topcoder.com/freeCodeCamp/coding-interview-prep/algorithms/implement-merge-sort

---
## Implement Binary Search

Binary search is an **O(log(n))** efficiency algorithm for searching a sorted array to find an element. It operates using the following steps:

1. Find the middle `value` of a sorted array. If `value == target` return (found it!).
2. If middle `value < target`, search right half of array in next compare.
3. If middle `value > target`, search left half of array in next compare.

As you can see, you are successively halving an array, which gives you the log(n) efficiency. For this challenge, we want you to show your work - how you got to the target value... the path you took!

Write a function `binarySearch` that implements the binary search algorithm on an array, returning the path you took (each middle value comparison) to find the target in an array.

The function takes a sorted array of integers and a target value as input. It returns an array containing (in-order) the middle value you found at each halving of the original array until you found the target value. The target value should be the last element of the returned array. If value not is found, return the string `Value Not Found`.

For example, `binarySearch([1,2,3,4,5,6,7], 5)` would return `[4,6,5]`.

For this challenge, when halving, you MUST use `Math.floor()` when doing division: `Math.floor(x/2)`. This will give a consistent, testable path.

**Note:** The following array is to be used in tests:

```ruby
testArray = [
  0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
  23, 49, 70
]
```

#### Tests

```ruby
p binarySearch(testArray, 0) == [13, 5, 2, 0]
p binarySearch(testArray, 1) == [13, 5, 2, 0, 1]
p binarySearch(testArray, 2) == [13, 5, 2]
p binarySearch(testArray, 6) == 'Value Not Found.'
p binarySearch(testArray, 11) == [13, 5, 10, 11]
p binarySearch(testArray, 13) == [13]
p binarySearch(testArray, 70) == [13, 19, 22, 49, 70]
```

https://academy.topcoder.com/freeCodeCamp/coding-interview-prep/algorithms/implement-binary-search
