=begin

https://www.codewars.com/kata/57cebe1dc6fdc20c57000ac9/train/ruby

Simple, given a string of words, return the length of the shortest word(s).
String will never be empty and you do not need to account for different data types.

Problem: 

  explicit:
    - return the number of characters of the shortest word(s) within a string
    - strings will never be empty
    - don't need to account for different data types
  implicit:
    - input is a string and the output is an integer

Examples:

  find_short("bitcoin take over the world maybe who knows perhaps") == 3
  find_short("turns out random test cases are easier than writing out basic ones") == 3
  find_short("lets talk about javascript the best language") == 3
  find_short("i want to travel the world writing code one day") == 1
  find_short("Lets all go on holiday somewhere very cold") == 2
  find_short("Let's travel abroad shall we") == 2

Data:

  input: string
  output: integer

Algorithm:

  - Break apart the string into substrings of individual words
    - create substrings delimited by spaces
      - words = s.split(" ") --> makes an array with elements of words
  - Return the word that has the shortest length
    - sort the array of words based on their length
      - words.sort_by { |word| word.size }
    - return the first element of the newly sorted array
      - #shift

Code:

  - What kind of if condition is best?
    - Some kind of comparison...
  - Sorting is a better idea
    - #sort needs 2 parameters
    - #sort_by only needs 1
  - #shift - removes first element and returns it
  - #unshift - puts an element at the beginning of a collection

=end

def find_short(s)
  l = s.split(" ").sort_by { |word| word.size }.shift.size
  return l # l: length of the shortest word
end

p find_short("bitcoin take over the world maybe who knows perhaps") #== 3
p find_short("turns out random test cases are easier than writing out basic ones") #== 3
p find_short("lets talk about javascript the best language") #== 3
p find_short("i want to travel the world writing code one day") #== 1
p find_short("Lets all go on holiday somewhere very cold") #== 2
p find_short("Let's travel abroad shall we") #== 2
