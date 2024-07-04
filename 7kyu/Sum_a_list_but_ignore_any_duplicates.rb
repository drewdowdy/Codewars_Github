# Please write a function that sums a list, but ignores any duplicated items in the list.

# For instance, for the list [3, 4, 3, 6] the function should return 10,
# and for the list [1, 10, 3, 10, 10] the function should return 4.

=begin

=== PROBLEM ===

Write a function that returns an integer that is the sum of a list, but disregards any numbers that appear more than once.

Rules:
  - It's not unique values, we want to IGNORE repeated values

=== EXAMPLES ===

sum_no_duplicates([1, 1, 2, 3]) == 5
  remove any duplicate numbers
  [2, 3]
  return the sum
=> 5

=== DATA ===

input: an array of integers
intermediate:
  - an array with repeated values removed
output: an integer that is the sum of all values, ignoring duplicate values from input

=== ALGORITHM ===

REJECT all values where the count is more than 1
RETURN the sum of the new array

=end

def sum_no_duplicates(l)
  l.reject { |n| l.count(n) > 1 }.sum
end

p sum_no_duplicates([1, 1, 2, 3]) == 5
p sum_no_duplicates([1, 1, 2, 2, 3]) == 3
