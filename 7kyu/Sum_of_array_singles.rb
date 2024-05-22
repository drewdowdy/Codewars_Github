=begin

https://www.codewars.com/kata/59f11118a5e129e591000134/train/ruby

In this Kata, you will be given an array of numbers in which two numbers occur once and the rest occur only twice. Your task will be to return the sum of the numbers that occur only once.

For example, repeats([4,5,7,5,4,8]) = 15 because only the numbers 7 and 8 occur once, and their sum is 15. Every other number occurs twice.

Problem:

  explicit:
    - given an array of numbers
    - some numbers occur only once, others occur only twice
    - define a method that returns the sum of all numbers that occur only once
  implicit:
    - no numbers will occur more than once or twice

Examples:

  repeats([4,5,7,5,4,8]) == 15
  repeats([9, 10, 19, 13, 19, 13]) == 19
  repeats([16, 0, 11, 4, 8, 16, 0, 11]) == 12
  repeats([5, 17, 18, 11, 13, 18, 11, 13]) == 22
  repeats([5, 10, 19, 13, 10, 13]) == 24

Data:

  input: array
  output: integer

Algorithim:

  - FIND the numbers that occur only once in the array
    - create a new array that contains only the numbers that appear once by using 
    - Use #select to choose elements with certain criteria
    - Use #count within #select to check if the count is exactly 1
      - arr.select{ |num| arr.count(num) == 1 }
  - FIND the sum of those numbers
    - add all of the numbers in the new array together
      - Array#reduce(:+)

Code:

  refactoring:
    - I used #reduce to add all the elements in the array together with `:+`
      - #sum could be better
    - Array#one?(obj) checks if there is exactly one `obj` in  `Array`

=end

def repeats(arr)
  arr.select{ |num| arr.count(num) == 1 }.reduce(:+)
end

p repeats([4, 5, 7, 5, 4, 8]) == 15
p repeats([9, 10, 19, 13, 19, 13]) == 19
p repeats([16, 0, 11, 4, 8, 16, 0, 11]) == 12
p repeats([5, 17, 18, 11, 13, 18, 11, 13]) == 22
p repeats([5, 10, 19, 13, 10, 13]) == 24

# Possible Better Solution:

def repeats(arr)
  arr.select{ |num| arr.one?(num) }.sum
end
