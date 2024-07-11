=begin
https://www.codewars.com/kata/550498447451fbbd7600041c

Given two arrays a and b write a function comp(a, b) (or compSame(a, b)) that checks whether the two arrays have the "same" elements, with the same multiplicities (the multiplicity of a member is the number of times it appears). "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

Examples
Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:

a = [121, 144, 19, 161, 19, 144, 19, 11] 
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
Invalid arrays
If, for example, we change the first number to something else, comp is not returning true anymore:

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 132 is not the square of any number of a.

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.

Remarks
a or b might be [] or {} (all languages except R, Shell).
a or b might be nil or null or None or nothing (except in C++, COBOL, Crystal, D, Dart, Elixir, Fortran, F#, Haskell, Nim, OCaml, Pascal, Perl, PowerShell, Prolog, PureScript, R, Racket, Rust, Shell, Swift).
If a or b are nil (or null or None, depending on the language), the problem doesn't make sense so return false.

=== PROBLEM ===

Write a function that returns true if a second input array contains all squares of a first input array

Rules:
  - Return nil if any input arrays are nil, empty, or a hash

=== EXAMPLES ===

a = [1, 2, 3]
b = [4, 1, 9]

comp(a, b) == true
  check if any numbers in the array with bigger nums is are the squares of any numbers in the array with smaller nums
    4 is the square of 1? No...
    4 is the square of 2? YES -> NEXT
    1 is the square of 1? YES -> NEXT
    9 is the square of 3? YES -> FINISH
=> true

a = [1, 2, 3]
b = [4, 10, 9]

=== DATA ===

input:
  - an array of integers
  - an array of integers that may be all the squares of the other array
intermediate:
  - a new array object that is the square root values of the original
output: true if one of the arrays contains all the squares of the integers in the other array

=== ALGORITHM ===

DETERMINE which of the input arrays is bigger
  Create an array with both arrays inside
  Get the array which has a bigger sum
CHANGE the array with bigger nums to their square roots
CHANGE the array with smaller nums to floats
SORT the arrays
COMPARE if the changed array and the smaller array are the same

=end

def comp(a, b)
  return false if a == nil || b == nil

  arrays = [a, b].sort_by { |array| array.sum }

  smaller = arrays[0].map(&:to_f)
  bigger = arrays[1].map { |num| Math.sqrt(num) }

  smaller.sort == bigger.sort
end

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
p comp(a, b) == true

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
p comp(a, b) == false

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
p comp(a, b) == false
