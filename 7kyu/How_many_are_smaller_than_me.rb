=begin
https://www.codewars.com/kata/56a1c074f87bc2201200002e

Write a function that given, an array arr, returns an array containing at each index i the amount of 
numbers that are smaller than arr[i] to the right.

* Input [5, 4, 3, 2, 1] => Output [4, 3, 2, 1, 0]
* Input [1, 2, 0] => Output [1, 1, 0]

=== PROBLEM ===

Write a function that returns an array of integers where each integer is the number of
integers that are smaller than the integer at the same index from a given array of integers.

Rules:
  - Input array and output array are the same size
  - Input array numbers can be pos or neg
  - Last num in output is always 0
    - There are 0 numbers right of the last num

=== EXAMPLES ===

smaller([1, 1, -1, 0, 0]) == [3, 3, 0, 0, 0]
  Iterate over the input  
    Remove the current integer
    1, remaining -> [1, -1, 0, 0]
    Count how many remaining nums are less than current num
    3
    add count to result
  [3]
  ...
=> [3, 3, 0, 0, 0]

=== DATA ====

input: an array of integers
intermediate:
  - an array of all remaining integers to the right of current integer
output: an array of integers that are all the count of how many integers to the right of the
corresponding integer from input is smaller

=== ALGORITHM ===

CREATE a copy of input array
ITERATE and replace each element from input (#map)
  Remove first integer from copy
  Count how many integers are smaller from remaining copy
END
RETURN the new array

=end

def smaller(arr)
  copy = arr.dup

  arr.map do
    current = copy.shift
    copy.count { |other| other < current }
  end
end

# Alternate Answer (Refactored)

def smaller(arr)
  arr.map.with_index do |current, idx| 
    arr[idx..-1].count { |other| other < current } 
  end
end

p smaller([5, 4, 3, 2, 1]) == [4, 3, 2, 1, 0]
p smaller([1, 2, 3]) == [0, 0, 0]
p smaller([1, 2, 0]) == [1, 1, 0]
p smaller([1, 2, 1]) == [0, 1, 0]
p smaller([1, 1, -1, 0, 0]) == [3, 3, 0, 0, 0]
p smaller([5, 4, 7, 9, 2, 4, 4, 5, 6]) == [4, 1, 5, 5, 0, 0, 0, 0, 0]

# Start: 13:15
# End: 13:28
