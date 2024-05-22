=begin

https://www.codewars.com/kata/51b62bf6a9c58071c600001b

=== PROBLEM ===

Write a method that takes an integer as an argument and returns the input number as a Roman numeral.

RULES:
  Explicit:
    - Input is an integer
    - Output is a combination of letters representing Roman numerals
    - Output cannot have 3 identical numerals in a row
  Implicit:
    - Output is a string?

Symbol    Value
I          1
V          5
X          10
L          50
C          100
D          500
M          1,000

=== E ===

roman_numeral(1) == "I"
roman_numeral(2) == "II"
roman_numeral(3) == "III"
roman_numeral(4) == "IV"
roman_numeral(5) == "V"
roman_numeral(6) == "VI"
roman_numeral(7) == "VII"
roman_numeral(8) == "VIII"
roman_numeral(9) == "IX"
roman_numeral(10) == "X"
roman_numeral(8) == "VIII"
roman_numeral(88) == "LXXXVIII"
roman_numeral(888) == "DCCCLXXXVIII"
roman_numeral(1990) == "MCMXC"
roman_numeral(2008) == "MMVIII"
roman_numeral(1666) == "MDCLXVI"

=== D ===

INPUT: integer
INTERMEDIATE: hash of roman numerals?
OUTPUT: a string of uppercase letters representing the input integer as a Roman numeral

=== A ===

CREATE a hash of powers of 10 as keys and  roman numerals as values
  - Initialize a hash called 'powers'
    - Each key is an integer 0, 1, 2 and 3 (powers of 10)
    - Each value is an array of all necessary numerals to create all numbers in that power of 10
CREATE an empty string to contain the new roman numeral
  - Initialize a variable pointing to an empty string object
APPEND a roman numeral for every digit 1-9 depending on the power of 10
  - Split the input integer into its digits and sort into the correct order
    - #digits (lowest power of 10 is first in the array)
  - Each digit's index in the array is the same as it's power of 10
  - Iterate over the array of digits and append the correct combinations of roman numerals
    - 1, 2, 3 : Additive
    - 4 : Subtractive
    - 5 : Normal
    - 6, 7, 8 : Additive 
    - 9 : Subtractive
    - 0 : Normal
  - Put all the roman numerals in reverse order into the variable for the empty string
RETURN the roman numeral
  - Reverse the variable for the roman numeral
    - #reverse

=== C ===

- How to change each number place...
  - 8 = VIII
  - 80 = LXXX
  - 800 = DCCC
  - Each number place has the same pattern of numerals, just one order of magnitude greater
- 4 and 9 are subtractive instead of additive
- Do I need a numeral hash?

=end

def roman_numeral(integer)
  powers = {
    0 => ['I', 'V', 'X'],
    1 => ['X', 'L', 'C'],
    2 => ['C', 'D', 'M'],
    3 => ['M']
  }

  new_numeral = ''

  integer.digits.each_with_index do |digit, i|
    case digit
    when (1..3) then new_numeral << powers[i][0] * digit
    when 4 then new_numeral <<  powers[i][1] + powers[i][0]
    when 5 then new_numeral << powers[i][1]
    when (6..8) then new_numeral <<  powers[i][0] * (digit - 5) + powers[i][1]
    when 9 then new_numeral <<  powers[i][2] + powers[i][0]
    end
  end

  new_numeral.reverse
end

# Alternate Solution

def roman_numeral(input_num)
  hash = {
    1000=>"M",
    900=>"CM",
    500=>"D",
    400=>"CD",
    100=>"C",
    90=>"XC",
    50=>"L",
    40=>"XL",
    10=>"X",
    9=>"IX",
    5=>"V",
    4=>"IV",
    1=>"I"
  }

  new_numeral = ''

  hash.each do |number, numeral|
    while input_num >= number
      new_numeral << numeral
      input_num -= number
    end
  end

  new_numeral
end


p roman_numeral(4) #== "IV"
p roman_numeral(9) #== "IX"
p roman_numeral(10) #== "X"
p roman_numeral(99) #== "XCIX"
p roman_numeral(88) #== "LXXXVIII"
p roman_numeral(1990) #== "MCMXC"
p roman_numeral(2008) #== "MMVIII"
p roman_numeral(1666) #== "MDCLXVI"

