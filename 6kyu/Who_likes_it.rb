=begin
https://www.codewars.com/kata/5266876b8f4bf2da9b000362

You probably know the "like" system from Facebook and other pages. People can "like" blog posts, pictures or other items. We want to create the text that should be displayed next to such an item.

Implement the function which takes an array containing the names of people that like an item. It must return the display text as shown in the examples:

[]                                -->  "no one likes this"
["Peter"]                         -->  "Peter likes this"
["Jacob", "Alex"]                 -->  "Jacob and Alex like this"
["Max", "John", "Mark"]           -->  "Max, John and Mark like this"
["Alex", "Jacob", "Mark", "Max"]  -->  "Alex, Jacob and 2 others like this"

Note: For 4 or more names, the number in "and 2 others" simply increases.

START: 13:48
END: 14:01

=== PROBLEM ===

Write a method that returns display text of who liked somehthing based on a given array of names.

Rules:
  - If input array is 0 names -> "no one likes this"
  - If input array is 1 name -> "{name} likes this"
  - If input array is 2 names -> "{name_1} and {name_2} like this"
  - If input array is 3 names -> "{name_1}, {name_2} and {name_3} like this"
  - If input array is >4 name -> "{name_1}, {name_2} and {total-2} others like this"

=== DATA ===

input: an array of strings that are names
intermediate:
  - array of names
  - "if" statements
  - result string
output: a string that says whitch names like something

likes(['Jacob', 'Alex']) == 'Jacob and Alex like this'
  since input array size is 2, we use "{name_1} and {name_2} like this"
  interpolate array[0] and array[1] into the result
END

=== ALGORITHM ===

CHECK the size of the input array
  IF 0
    Use the "no one" string
  IF 1
    Interpolate the name at index 0 into result string
  IF 2
    Interpolate the names at index 0 and index 1 into result string
  IF 3
    Interpolate the names at index 0, 1, and 2 into result string
  IF > 4
    Interpolate the names at index 0 and 1 into result string
    The remaining is the length of the array minus 2
  END
END
RETURN the result string

=end

def likes(names)
  case names.size
  when 0
    'no one likes this'
  when 1
    "#{names[0]} likes this"
  when 2
    "#{names[0]} and #{names[1]} like this"
  when 3
    "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else
    "#{names[0]}, #{names[1]} and #{names.size - 2} others like this"
  end
end

p likes([]) == 'no one likes this'
p likes(['Peter']) == 'Peter likes this'
p likes(['Jacob', 'Alex']) == 'Jacob and Alex like this'
p likes(['Max', 'John', 'Mark']) == 'Max, John and Mark like this'
p likes(['Alex', 'Jacob', 'Mark', 'Max']) == 'Alex, Jacob and 2 others like this'
