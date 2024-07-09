=begin
https://www.codewars.com/kata/520b9d2ad5c005041100000f

Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.

=== PROBLEM ===

Write a method that puts the first letter at the end of each word and also ads "ay" to the end of each word.

Rules:
  - Punctuation marks should remain as they are

=== EXAMPLES ===

pig_it('Hello world !') == "elloHay orldway !"
  Split the string into an array
    ['Hello', 'world', '!']
  Iterate over the array
    'Hello' -> "ello + 'H' + 'ay'
  Join the new array back into a string
    ['elloHay', 'orldway', '!'] -> "elloHay orldway !"
=> "elloHay orldway !"

=== DATA ===

input: a string of letters a-z (any case), spaces, and punctuation
intermediate:
  - an array of words
output: a string where the first letter of each word is moved to the end and "ay" is added to the end of each word

=== ALGORITHM ===

SPLIT the string into words array
ITERATE over the array (#map)
  if current word is NOT letters a-z...
    current word
  else
    slice[1..-1] + slice[0] + "ay"
  END
END
JOIN the array back to a string
RETURN the new string

=end

def pig_it(text)
  text.split.map do |word|
    if word =~ /\A[a-z]+\z/i
      word[1..-1] + word[0] + 'ay'
    else 
      word 
    end
  end.join(' ')
end

p pig_it('Pig latin is cool') #== "igPay atinlay siay oolcay"
p pig_it('Hello world !') #== "elloHay orldway !"
