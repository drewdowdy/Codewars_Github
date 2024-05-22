=begin

https://www.codewars.com/kata/5865918c6b569962950002a1/train/ruby

Problem:

  Create a function that accepts a string and a single character, and returns an integer of the count of occurrences the 2nd argument is found in the first one. If no occurrences can be found, a count of 0 should be returned.

  explicit:
    - the method should accecpt two arguments
    - the method should return an integer
    - the integer represents how many times the second string occurs in the first string
    - the method should return 0 if no occurances
  implicit:
    - second string should be one character (could be longer?)

Examples:

  str_count("Hello", 'o') == 1
  str_count("Hello", 'l') == 2
  str_count("", 'z') == 0

Data:

  input: 2 strings
  output: integer

Algorithm:

  - TRANSFORM the word into an array.
    - initialize variable representing the array of letters in 'word'
      - word_array = word.chars
  - COUNT how many times the letter appears in the word array
    - initialize a variable representing the number of times 'letter' appears in the word array
      - count = 0
    - increment the count variable by 1 everytime an instance of 'letter' is in the word array
      - word.each { |let| count += 1 if let == letter }
  - RETURN that number
    - return the count variable
      - return count

=end

def str_count(word, letter) 
  count = 0

  word.chars.each { |let| count += 1 if let == letter }

  count
end

p str_count("Hello", 'o') == 1
p str_count("Hello", 'l') == 2
p str_count("", 'z') == 0

=begin

This was the simplest solution:

def str_count(word, letter)
  word.count(letter)
end

Apparently, String#count(obj) will return an integer representing the number of instances of `obj`

=end

#MY ANSWER REFACTORED:

def str_count(word, letter)
  count = 0
  word.chars.each { |let| count += 1 if let == letter }
  count
end
