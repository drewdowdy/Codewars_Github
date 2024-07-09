=begin
https://www.codewars.com/kata/5264d2b162488dc400000001

Write a function that takes in a string of one or more words, and returns the same string, but with all words that have five or more letters reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

Examples:

"Hey fellow warriors"  --> "Hey wollef sroirraw" 
"This is a test"        --> "This is a test" 
"This is another test" --> "This is rehtona test"

=== PROBLEM ===

Write a method that reverses any word that has 5 or more letters in it

Rules:
  - Input strings will only have letters a-z (any case) and spaces
  - Spaces are used to separate words

Questions:
  - Should the method be mutating or non-mutating? ("return the same string") -> Let's say NO, since the content is more important

=== EXAMPLES ===

spin_words("Hey fellow warriors") == "Hey wollef sroirraw"
  Split the words apart
    ["Hey", "fellow", "warriors"]
  Iterate over the array, checking is the current word is 5 chars or more
    "Hey" -> 5 or more? No...
    "fellow" -> 5 or more? YES -> reverse, "wollef"
    "warriors" -> 5 or more? YES -> reverse, "sroirraw"
  Return the string
=> "Hey wollef sroirraw"

=== DATA ===

input: a string of letters a-z in any case, and spaces between words
intermediate:
  - an array containing all of the words
output: a new string object where the words that have 5 or more characters are reversed

=== ALGORITHM ===

SPLIT the string into an array of words
ITERATE over the array of words (#map)
  If the current word has 5 or more chars...
    Reverse the word
  Otherwise..
    Same word
  END
END
JOIN the array back into a string
RETURN the new string

=end

def spin_words(string)
  string.split.map { |w| w.size >= 5 ? w.reverse : w }.join(' ')
end

p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"
p spin_words("This is a test" ) == "This is a test" 
p spin_words("This is another test") == "This is rehtona test"
