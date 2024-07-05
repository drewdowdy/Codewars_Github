=begin
https://www.codewars.com/kata/56dbe7f113c2f63570000b86

You are given a string of n lines, each substring being n characters long: For example:

s = "abcd\nefgh\nijkl\nmnop"

We will study some transformations of this square of strings.

Clock rotation 180 degrees: rot

rot(s) => "ponm\nlkji\nhgfe\ndcba"

selfie_and_rot(s) (or selfieAndRot or selfie-and-rot) It is initial string + string obtained by clock rotation 180 degrees with dots interspersed in order (hopefully) to better show the rotation when printed.

s = "abcd\nefgh\nijkl\nmnop" --> "abcd....\nefgh....\nijkl....\nmnop....\n....ponm\n....lkji\n....hgfe\n....dcba"

or printed:
|rotation        |selfie_and_rot
|abcd --> ponm   |abcd --> abcd....
|efgh     lkji   |efgh     efgh....
|ijkl     hgfe   |ijkl     ijkl....   
|mnop     dcba   |mnop     mnop....
                           ....ponm
                           ....lkji
                           ....hgfe
                           ....dcba
Notice that the number of dots is the common length of "abcd", "efgh", "ijkl", "mnop".

Task:
Write these two functions rot and selfie_and_rot
and

high-order function oper(fct, s) where

- fct is the function of one variable f to apply to the string s (fct will be one of rot, selfie_and_rot)

Examples:

s = "abcd\nefgh\nijkl\nmnop"
oper(rot, s) => "ponm\nlkji\nhgfe\ndcba"

oper(selfie_and_rot, s) => "abcd....\nefgh....\nijkl....\nmnop....\n....ponm\n....lkji\n....hgfe\n....dcba"

Notes:
The form of the parameter fct in oper changes according to the language. You can see each form according to the language in "Your test cases".
It could be easier to take these katas from number (I) to number (IV)
Forthcoming katas will study other tranformations.

Bash Note:
The input strings are separated by , instead of \n. The ouput strings should be separated by \r instead of \n. See "Sample Tests".

=== PROBLEM ===

Write 2 methods that...

1. rot:
Rotates a given square string 180 degrees clockwise

2. selfie_and_rot:
Rotates a given square string 180 degrees clockwise and reflects it from the last letter

=== EXAMPLES ===

rot:

rot("abcd\nefgh\nijkl\nmnop") == "ponm\nlkji\nhgfe\ndcba"
  split the string at the newline (\n)
    ['abcd', 'efgh', 'ijkl', 'mnop']
  reverse each string element
    ["dcba", "hgfe", "lkji", "ponm"]
  reverse element order
    ["ponm", "lkji", "hgfe", "dcba"]
  join with newline (\n)
=> "ponm\nlkji\nhgfe\ndcba"

selfie_and_rot:

selfie_and_rot("abcd\nefgh\nijkl\nmnop") == "abcd....\nefgh....\nijkl....\nmnop....\n....ponm\n....lkji\n....hgfe\n....dcba"
  call #rot
    "ponm\nlkji\nhgfe\ndcba"
  to input, add "." times the number of letters AFTER the letters
    "abcd....\nefgh....\nijkl....\nmnop...."
  to #rot call, add "." times the number of letters BEFORE the letters
    "....ponm\n....lkji\n....hgfe\n....dcba"
  add the two strints together
=> "abcd....\nefgh....\nijkl....\nmnop....\n....ponm\n....lkji\n....hgfe\n....dcba"

=== DATA ===

rot:

input: a string with multiple newlines (\n)
intermediate:
  - an array of string elements split at the newline
output: a new string that is the rotation of the string 180 degrees clockwise

selfie_and_rot:

input: a string with multiple newlines (\n)
intermediate:
  - a new input string object (to add periods to)
  - a rotated string object (to add periods to)
output: a new string object that is the original string with periods and the rotation of the string with periods 

=== ALGORITHM ===

rot:

SPLIT the string into an array of letters
REVERSE each of the string elements
REVERSE the order of the array
RETURN the reversed array

=end

=begin

=== ALGORITHM ===

rot:

SPLIT the string into an array of letters
REVERSE each of the string elements
REVERSE the order of the array
JOIN the array back together with newlines (\n)
RETURN the new string

selfie_and_rot:

ADD periods to the input string
  - Split the input string at the newline (\n)
  - Iterate over the array of strings (#map)
    - current string plus '.' times the size of the current string
  END
INITIALIZE 'rotaton' to be the input string passed to an invocation of #rot
ADD periods to the rotation
  - Split the input string at the newline (\n)
  - Iterate over the array of strings (#map)
    - '.' times the size of the current string plus the current string
  END
ADD the period input string to the period rotation
RETURN the addition

=end

def rot(strng)
  strng.split("\n").map{ |s| s.reverse }.reverse.join("\n")
end

def selfie_and_rot(strng)
  period_input = strng.split("\n").map do |s|
    s + ('.' * s.size) 
  end.join("\n")

  period_rotation = rot(strng).split("\n").map do |s|
    ('.' * s.size) + s
  end.join("\n")

  period_input + "\n" + period_rotation
end

def oper(fct, s) 
  s.method(fct)
end

p rot("fijuoo\nCqYVct\nDrPmMJ\nerfpBA\nkWjFUG\nCVUfyL") == "LyfUVC\nGUFjWk\nABpfre\nJMmPrD\ntcVYqC\nooujif"
p rot("rkKv\ncofM\nzXkh\nflCB") == "BClf\nhkXz\nMfoc\nvKkr"

p selfie_and_rot("xZBV\njsbS\nJcpN\nfVnP") == "xZBV....\njsbS....\nJcpN....\nfVnP....\n....PnVf\n....NpcJ\n....Sbsj\n....VBZx"
p selfie_and_rot("uLcq\nJkuL\nYirX\nnwMB") == "uLcq....\nJkuL....\nYirX....\nnwMB....\n....BMwn\n....XriY\n....LukJ\n....qcLu"

p oper(method(:rot), "fijuoo\nCqYVct\nDrPmMJ\nerfpBA\nkWjFUG\nCVUfyL"), "LyfUVC\nGUFjWk\nABpfre\nJMmPrD\ntcVYqC\nooujif"
p oper(method(:rot), "rkKv\ncofM\nzXkh\nflCB") == "BClf\nhkXz\nMfoc\nvKkr"
p oper(method(:selfie_and_rot), "xZBV\njsbS\nJcpN\nfVnP") == "xZBV....\njsbS....\nJcpN....\nfVnP....\n....PnVf\n....NpcJ\n....Sbsj\n....VBZx"
p oper(method(:selfie_and_rot), "uLcq\nJkuL\nYirX\nnwMB") == "uLcq....\nJkuL....\nYirX....\nnwMB....\n....BMwn\n....XriY\n....LukJ\n....qcLu"
