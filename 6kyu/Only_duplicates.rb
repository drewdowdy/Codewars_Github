=begin
https://www.codewars.com/kata/5a1dc4baffe75f270200006b/train/ruby

Given a string, remove any characters that are unique from the string.

Example:

input: "abccdefee"

output: "cceee"

=== PROBLEM ===

Write a method that removes any unique chars from a given string

Rules:
  - None...

Questions:
  - Should it be mutating or non-mutating? -> non-mutating

=== EXAMPLES ===

only_duplicates('abccdefee') == 'cceee'
  Iterate over the characters
  a -> appears once? -> YES, remove
  b -> appears once? -> YES, remove
  c -> appears once? -> No, keep
  c -> appears once? -> No, keep
  d -> appears once? -> YES, remove
  e -> appears once? -> No, keep
  f -> appears once? -> YES, remove
  e -> appears once? -> No, keep
  e -> appears once? -> No, keep
=> "cceee"

=== DATA ===

input: a string of letters a-z (lowercase), and numbers
intermediate:
  - an array of characters
output: a new string object that is all unique chracters removed from the given string

=== ALGORITHM ===

CREATE an array of characters
ITERATE over the array of characters
  IF the current char appears once...
    keep it
  ELSE
    remove it
  END
END
JOIN the array back into a string
RETURN the new string

=end

def only_duplicates(str)
  str.chars.map { |l| str.count(l) > 1 ? l : '' }.join
end

p only_duplicates('abccdefee') == 'cceee'
p only_duplicates('hello') == 'll'
p only_duplicates('colloquial') == 'ollol'
p only_duplicates('foundersandcoders') == 'ondersndoders'
p only_duplicates('121212aavcdas246512') == '121212aaa212'
p only_duplicates('12314256aaeff') == '1212aaff'
