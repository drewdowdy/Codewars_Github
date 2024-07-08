=begin
https://www.codewars.com/kata/514b92a657cdc65150000006

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Additionally, if the number is negative, return 0.

Note: If the number is a multiple of both 3 and 5, only count it once.

Courtesy of projecteuler.net (Problem 1)

=== PROBLEM ===

Write a function that returns the sum of all the numbers that are less that a given number and are also multiples of either 3 or 5.

Rules:
  - If number is < 0, return 0
  - If number is a multiple of 3 AND 5, count it only once

=== EXAMPLES ===

solution(10) == 23
  Multiples of 3 less than 10? -> [3, 6, 9]
  Multiples of 5 less than 10? -> [5]
  Get the sum -> [3, 6, 9] + [5] -> 23
=> 23

solution(20) == 
  Multiples of 3 less than 20? -> [3, 6, 9, 12, 15, 18]
  Multiples of 5 less than 20? -> [5, 10, 15]
  Only count unique values -> [3, 6, 9, 12, 15, 18]+[5, 10]
  Get the sum -> [3, 6, 9, 12, 15, 18]+[5, 10, 15] -> 78
=> 78

=== DATA ===

input: a number that is the limit
intermediate:
  - conditional loop
  - an array to reference all multiples
output: the sum of all of the multiples of 3 and 5 that are less than the input limit number

=== ALGORITHM ===

RETURN 0 if input number is less than 0
INITIALIZE `multiples` to reference empty array object to contain all multiples
INITIALIZE 'current_number' to reference 0
LOOP
  reassign current number to current number plus 3
  if current_number is greater than limit, break
  otherwise, add it to the multiples array
END
RESET current_number back to 0
LOOP
  reassign current number to current number plus 5
  if current_number is greater than limit, break
  otherwise, add it to the multiples array
END
RETURN the sum of the unique multiples array

=end

def solution(number)
  return 0 if number < 0

  multiples = []
  current_number = 0

  loop do 
    current_number += 3
    break if current_number >= number
    multiples << current_number
  end

  current_number = 0

  loop do 
    current_number += 5
    break if current_number >= number
    multiples << current_number
  end

  multiples.uniq.sum
end

# Refactored

def solution(number)
  return 0 if number < 0
  (1...number).select { |num| num % 3 == 0 || num % 5 == 0 }.sum
end

p solution(10) #== 23
p solution(20) #== 78
p solution(-5) #== 0
p solution(1) #== 0
