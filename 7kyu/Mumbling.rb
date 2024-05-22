=begin

https://www.codewars.com/kata/5667e8f4e3f572a8f2000039/train/ruby

This time no story, no theory. The examples below show you how to write function accum:

Examples:
accum("abcd") -> "A-Bb-Ccc-Dddd"
accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
accum("cwAt") -> "C-Ww-Aaa-Tttt"

The parameter of accum is a string which includes only letters from a..z and A..Z.

Problem:

  explicit:
    - transform the string by the following rules:
      - 1. make a group of letters that are the same number of letters as the current position
      - 2. capitalize the first letter in the group
      - 3. separate the groups by a dash
      - 4. repeat pattern for each letter in the string
    - ie. the first position, there's 1 letter capitalized
      - in the second position, there's 2 letters and the first letter is capitalized
      - in the third position, there's 3 letters and the first letter is capitalized

Examples:

  accum("abcd") == "A-Bb-Ccc-Dddd"
  accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
  accum("cwAt") == "C-Ww-Aaa-Tttt"
  accum("ZpglnRxqenU") == "Z-Pp-Ggg-Llll-Nnnnn-Rrrrrr-Xxxxxxx-Qqqqqqqq-Eeeeeeeee-Nnnnnnnnnn-Uuuuuuuuuuu"
  accum("NyffsGeyylB") == "N-Yy-Fff-Ffff-Sssss-Gggggg-Eeeeeee-Yyyyyyyy-Yyyyyyyyy-Llllllllll-Bbbbbbbbbbb"
  accum("MjtkuBovqrU") == "M-Jj-Ttt-Kkkk-Uuuuu-Bbbbbb-Ooooooo-Vvvvvvvv-Qqqqqqqqq-Rrrrrrrrrr-Uuuuuuuuuuu"
  accum("EvidjUnokmM") == "E-Vv-Iii-Dddd-Jjjjj-Uuuuuu-Nnnnnnn-Oooooooo-Kkkkkkkkk-Mmmmmmmmmm-Mmmmmmmmmmm"
  accum("HbideVbxncC") == "H-Bb-Iii-Dddd-Eeeee-Vvvvvv-Bbbbbbb-Xxxxxxxx-Nnnnnnnnn-Cccccccccc-Ccccccccccc"

Data:

  Input: string
  Output: string

Algorithm:

  - Create a placeholder for the new string
    - new_string = []
  - Create a placeholder for the position of the letter
    - count = 1
  - For each character in the string, apply change rules
    - letters = s.chars --> creates an array of letters
    - letters.each do |letter| 
        group = ""
        group << letter*count
        group.capitalize!
        new_string << group
        count += 1
      end
  - Return the placeholder
    - implicitly return placeholder as the last line

Code:

  - #each_with_index would remove the necessity of a `count` variable

=end

def accum(s)
	new_string = []

  s.chars.each_with_index do |letter, index| 
    group = ""
    group << letter*(index+1)
    group.capitalize!

    new_string << group
  end

  new_string.join("-")
end

p accum("abcd") #== "A-Bb-Ccc-Dddd"
p accum("RqaEzty") #== "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt") #== "C-Ww-Aaa-Tttt"
p accum("ZpglnRxqenU") #== "Z-Pp-Ggg-Llll-Nnnnn-Rrrrrr-Xxxxxxx-Qqqqqqqq-Eeeeeeeee-Nnnnnnnnnn-Uuuuuuuuuuu"
p accum("NyffsGeyylB") #== "N-Yy-Fff-Ffff-Sssss-Gggggg-Eeeeeee-Yyyyyyyy-Yyyyyyyyy-Llllllllll-Bbbbbbbbbbb"
p accum("MjtkuBovqrU") #== "M-Jj-Ttt-Kkkk-Uuuuu-Bbbbbb-Ooooooo-Vvvvvvvv-Qqqqqqqqq-Rrrrrrrrrr-Uuuuuuuuuuu"
p accum("EvidjUnokmM") #== "E-Vv-Iii-Dddd-Jjjjj-Uuuuuu-Nnnnnnn-Oooooooo-Kkkkkkkkk-Mmmmmmmmmm-Mmmmmmmmmmm"
p accum("HbideVbxncC") #== "H-Bb-Iii-Dddd-Eeeee-Vvvvvv-Bbbbbbb-Xxxxxxxx-Nnnnnnnnn-Cccccccccc-Ccccccccccc"

# Better Solution:

def accum(s)
  s.chars.each_with_index.map{ |c, i| c.upcase + c.downcase * i }.join('-')
end
