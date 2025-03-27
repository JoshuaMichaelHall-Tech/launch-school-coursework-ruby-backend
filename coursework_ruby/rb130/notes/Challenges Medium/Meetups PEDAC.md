## Problem

Meetup date objects take a month number and a year
Should be able to determine the exact date of a meeting from descriptors, ('first'), ('Monday), case is irrelevant. Output should be 'the 12th of May 2021'.

## Examples

- The first Monday of January 2021
- The third Tuesday of December 2020
- The teenth Wednesday of December 2020
- The last Thursday of January 2021

## Data Structures

The descriptors that may be given are strings: `'first'`, `'second'`, `'third'`, `'fourth'`, `'fifth'`, `'last'`, and `'teenth'`.

The days of the week are given by the strings `'Monday'`, `'Tuesday'`, `'Wednesday'`, `'Thursday'`, `'Friday'`, `'Saturday'`, and `'Sunday'`.

array of days during month which fit weekday
## Algorithm


Meetup class 
constructor holding year and month
day method taking weekday and schedule and returning civil day
  returns array of dates corresponding to that weekday in that month and year
helper method qualifies days
  selects from weekday dates using case