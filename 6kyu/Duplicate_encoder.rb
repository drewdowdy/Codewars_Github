=begin
https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/train/ruby

The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.

Examples
"din"      =>  "((("
"recede"   =>  "()()()"
"Success"  =>  ")())())"
"(( @"     =>  "))((" 

=== PROBLEM ===

Write a method that replaces all of the characters in a given string. The new characters is '(' if the character appears only once and ')' if the character appears more than once.

Rules:
  - Case insensitive (ie. a == A)
  - Spaces are considered characters

=== EXAMPLES ===

duplicate_encode("recede") == "()()()"
  r -> how many times? (1) -> (
  e -> how many times? (3) -> )
  c -> how many times? (1) -> (
  e -> how many times? (3) -> )
  d -> how many times? (1) -> (
  e -> how many times? (3) -> )
=> "()()()"

=== DATA ===

input: a string of letters a-z (any case), spaces, and special characters
intermediate
  - an array of characters
output: a new string that is left and right parenthesis only

=== ALGORITHM ===

SPLIT the string into an array of characters
ITERATE over the array (#map)
  IF the count of the current char is 1,
    replace with '('
  ELSE
    replace with ')'
  END
END
JOIN the array back into a string
RETURN the new string

=end

def duplicate_encode(word)
  lower = word.downcase
  lower.chars.map { |char| lower.count(char) == 1 ? '(' : ')' }.join
end

# Human Readable

def duplicate_encode(word)
  lower_case_string = word.downcase

  array = lower_case_string.chars

  parenthesis = array.map do |character|
    if lower.count(character) == 1
      '('
    else
      ')'
    end
  end

  parenthesis.join
end

# Alternate Idea

def duplicate_encode(word)
  word.downcase.gsub(/./) { |char| word.downcase.count(char) == 1 ? '(' : ')' }
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("
