# https://www.codewars.com/kata/513e08acc600c94f01000001/train/ruby

# The rgb function is incomplete. Complete it so that passing in RGB decimal values will result in a hexadecimal representation being returned. Valid decimal values for RGB are 0 - 255. Any values that fall out of that range must be rounded to the closest valid value.

# Note: Your answer should always be 6 characters long, the shorthand with 3 will not work here.

=begin

=== PROBLEM ===

Write a method that takes 3 integer values of r, g, and b from 0 to 255 and returns the hexadecimal representaion of it

=end

HEX_HASH = {
  0 => '00',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
  10 => 'A',
  11 => 'B',
  12 => 'C',
  13 => 'D',
  14 => 'E',
  15 => 'F'
}

def to_hex(number)
  quotient, remainder = number.divmod(16)
  hex_num = "#{HEX_HASH[remainder]}"

  until quotient == 0
    quotient, remainder = quotient.divmod(16)
    hex_num = HEX_HASH[remainder] + hex_num
  end

  hex_num
end

def rgb(r, g, b)
  limited_r = r.clamp(0, 255)
  limited_g = g.clamp(0, 255)
  limited_b = b.clamp(0, 255)

  if limited_r.size < 2
    '0' + limited_r
  end

  if limited_g.size < 2
    '0' + limited_g
  end
  
  if limited_b.size < 2
    '0' + limited_b
  end

  to_hex(limited_r) + to_hex(limited_g) + to_hex(limited_b)
end

p to_hex(2)
p to_hex(10)
p to_hex(20)
p to_hex(30)
p to_hex(100)
p to_hex(255)

p rgb(255, 255, 255) == "FFFFFF"
p rgb(255, 255, 300) == "FFFFFF"
p rgb(0, 0, 0)       == "000000"
p rgb(148, 0, 211)   == "9400D3"
