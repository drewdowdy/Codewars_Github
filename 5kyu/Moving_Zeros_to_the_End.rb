=begin
https://www.codewars.com/kata/52597aa56021e91c93000cb0

Write an algorithm that takes an array and moves all of the zeros to the end, preserving the order of the other elements.

moveZeros [1,2,0,1,0,1,0,3,0,1] #-> [1,2,1,1,3,1,0,0,0,0]

=== PROBLEM ===

Write a method that moves all 0's to the end of a given array of integers.

Rules:  
 - Must preserve the original order of the other numbers in the array

=== EXAMPLES ===

moveZeros([1,2,0,1,0,1,0,3,0,1]) == [ 1, 2, 1, 1, 3, 1, 0, 0, 0, 0 ]
  ITERATE over the collection
  1 -> is it 0? -> No, move to nums [1]
  2 -> is it 0? -> No, move to nums [1, 2]
  0 -> is it 0? -> YES, move to zeros [0]
  1 -> is it 0? -> No, move to nums [1, 2, 1]
  0 -> is it 0? -> YES, move to zeros [0, 0]
  1 -> is it 0? -> No, move to nums [1, 2, 1, 1]
  0 -> is it 0? -> YES, move to zeros [0, 0, 0]
  3 -> is it 0? -> No, move to nums [1, 2, 1, 1, 3]
  0 -> is it 0? -> YES, move to zeros [0, 0, 0]
  1 -> is it 0? -> No, move to nums [1, 2, 1, 1, 3, 1]
  add the two collections together 
  [1, 2, 1, 1, 3, 1] + [0, 0, 0, 0]
=> [ 1, 2, 1, 1, 3, 1, 0, 0, 0, 0 ]

=== DATA ===

input: an array of integers
intermediate
  - an array of non-zero integers
  - an array of all zero integers
output: an array fo integers where all the 0's from the input integer are moved to the end

=== ALGORITHM ===

INITIALIZE 'nums' to reference an empty array
INITIALIZE 'zeros' to reference an empty array
ITERATE over the input array (#each)
  IF the current num is 0...
    put in the zeros array
  ELSE
    put in the nums array
  END
END
ADD the two arrays together

=end

def moveZeros(arr) 
  nums = []
  zeros = []

  arr.each { |n| n == 0 ? zeros << n : nums << n }

  nums + zeros
end

# Alternate Idea

def moveZeros(arr)
  arr.sort_by { |n| n == 0 ? 1 : 0 }
end

# `#sort_by` sorts by ascending order, so anything with sort value 0 would come before anything with sort value 1

p moveZeros([1,2,0,1,0,1,0,3,0,1]) #== [ 1, 2, 1, 1, 3, 1, 0, 0, 0, 0 ]

