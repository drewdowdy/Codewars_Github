=begin

https://www.codewars.com/kata/58d248c7012397a81800005c/train/ruby

To find the volume (centimeters cubed) of a cuboid you use the formula:

volume = Length * Width * Height

But someone forgot to use proper record keeping, so we only have the volume, and the length of a single side!
It's up to you to find out whether the cuboid has equal sides (= is a cube).

Return true if the cuboid could have equal sides, return false otherwise.
Return false for invalid numbers too (e.g volume or side is less than or equal to 0).

Note: side will be an integer

Problem:

  explicit:
    - volume = Length * Width * Height
    - a cube will be side^3
    - return true if side^3 is the same as the volume
    - return false otherwise (and for invalid numbers)
    - the side will always be an integer
  implicit:
    - a cube has all equal sides

Examples:

  cube_checker(-12, 2) == false
  cube_checker(8, 3) == false
  cube_checker(8, 2) == true
  cube_checker(-8, -2) == false
  cube_checker(0, 0) == false
  cube_checker(27, 3) == true
  cube_checker(1, 5) == false
  cube_checker(125, 5) == true
  cube_checker(125, -5) == false
  cube_checker(0, 12) == false
  cube_checker(12, -1) == false
  cube_checker(1, 1) == true

Data

  input: two integers
  output: boolean

Algorithim:

  - CHECK if any numbers are negative; if so, return false
    - return false if either the volume or side is less than zero
      - return false if volume < 0 || side < 0
  - FIND the volume of cube based on the one side
    - calculate the possible volume by cubing the side
      - possible_volume = side**3
  - COMPARE the side volume to provided volume
    - possible_volume == volume
  - RETURN true if they're the same, false otherwise
    - use a ternary operator to return either true or false
      - possible_volume == volume ? true : false

Code:

  refactoring:
    - don't need the ternary operator since true and false can implicitly return
    - don't need a variable to hold the `possible_volume`
    - not `< 0` becasue it doesn't account for volume or side equal to 0
      - shold be `< 1`

end
  

=end

def cube_checker(volume, side)
  return false if volume < 1 || side < 1
  side**3 == volume
end

p cube_checker(-12, 2) == false
p cube_checker(8, 3) == false
p cube_checker(8, 2) == true
p cube_checker(-8, -2) == false
p cube_checker(0, 0) == false
p cube_checker(27, 3) == true
p cube_checker(1, 5) == false
p cube_checker(125, 5) == true
p cube_checker(125, -5) == false
p cube_checker(0, 12) == false
p cube_checker(12, -1) == false
p cube_checker(1, 1) == true

# Possible Better solution:

def cube_checker(volume, side)
  volume > 0 && side > 0 && (side**3 == volume)
end
