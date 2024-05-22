=begin

https://www.codewars.com/kata/557b5e0bddf29d861400005d/train/ruby

Sometimes, I want to quickly be able to convert miles per imperial gallon (mpg) into kilometers per liter (kpl).

Create an application that will display the number of kilometers per liter (output) based on the number of miles per imperial gallon (input).
Make sure to round off the result to two decimal points.

Some useful associations relevant to this kata:
  1 Imperial Gallon = 4.54609188 litres
  1 Mile = 1.609344 kilometres

Problem: 

  Create a method that intakes miles per gallon number (mpg) and returns the conversion to kilometers per liter (kpl). The mothod should round to the nearest hundreth.

  explicit:
    - method takes a number as an argument
  implicit:
    - method outputs a float

Examples:

  converter(12) == 4.25
  converter(24) == 8.50
  converter(36) == 12.74

Data:

  input: integer
  output: float (2 matissa)

Algorithm:

  - CONVERT mpg to kpl
    - initialize a variable to hold the number kilometres (which is the conversion times the miles)
      - kilometres = mpg*1.609344
    - initialize a variable to represent the number of liters (which is always 1)
      - litres = 4.54609188
    - multiply miles by litres constant
      - mpg*gallon_to_litres
    - divide that number by kilometres constant
      - ()/miles_to_kilometres
  - ROUND the kpl number to two matissa
    - round the kpl to the nearest two decimal places
      - Float#round(int)
  - RETURN the kpl number
    - state the nubmer as the last line for an implicit return of the value

Code:

=end

def converter(mpg)
  kilometers = mpg*1.609344
  litres = 4.54609188
  
  kpl = kilometers/litres
  kpl.round(2)
end

p converter(12) == 4.25
p converter(24) == 8.50
p converter(36) == 12.74

# REFACTORED:

def converter(mpg)
  (mpg*1.609344/ 4.54609188).round(2)
end
