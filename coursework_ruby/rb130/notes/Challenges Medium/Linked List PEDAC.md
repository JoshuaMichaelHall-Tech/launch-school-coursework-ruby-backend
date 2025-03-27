PROBLEM

Build a linked list. Each element contains data and a next field pointing to the next element. Need methods to reverse the list and convert it to and from an array.
  

EXAMPLES

We need the following classes and methods:

Element
- new(arg(s))
- datum
- tail?
- next  # points to the next Element object. How to populate when next is created?
SimpleLinkedList
- size
- list
- empty?
- push
- peek
- head
- pop
- self.from_a(array)
- to_a
- reverse


DATA

Element objects holding data and references to the next object.
data1(1, data2), data2(2, data3), data3(3, nil)

SimpleList object managing references to and within element objects 

ALGORITHM

Element
- new(arg(s))
	- takes 1st arg as data, second optional is next element(must be writable from outside class)
- datum
	- variable, need reader
- tail?
	- checks if next is nil
- next  # points to the next Element object. How to populate when next is created?
	- variable, need reader and writer
SimpleLinkedList
- size
	- checks number of Element objects
- empty?
	- boolean check if list is empty
- push
	- adds new Element to list, updates previous element next to point to new element (how to reference the element?)
- peek
	- returns data of last Element
- head
	- returns last Element in list
- pop
	- removes last Element and returns its data
- self.from_a(array)
	- creates elements from each datum in a given array
- to_a
	- returns array of all data from list
- reverse
	- reverses the Elements in the list and updates their 'next' accordingly
		- Start 1(1 -> 2), 2(2 -> 3), 3(3 -> nil)
		- Result 3(3 -> 2), 2(2 -> 1), 1(1 -> nil)