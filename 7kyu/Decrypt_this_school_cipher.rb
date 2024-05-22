=begin

https://www.codewars.com/kata/5cd48cffaae6e30018943175/train/ruby

School students Alice and Bob send messages to each other. To ensure that their messages are not readable by teachers they encrypt text with simple algorythm. Every message contains only latin letters (lowercase and uppercase), digits from 0 to 9 and space symbol.

So, the encryption algorythm is:

1) Reverse the whole string.
2) Replace every letter with it ASCII code in quotes (A to '65', h to '104' and so on).
3) Insert digits and spaces as is.

E.g. this message

9Hi Alice4

is encrypted as

4'101''99''105''108''65' '105''72'9

Your task is to write function decrypt to get source messages from encrypted strings.

Problem:

  explicit:
    - all messages have only latin letters (upper and lower), digits 0-9 and space.
    - encryption:
      1. reverse string
      2. replace each letter with ASCII code in quotes
      3. digits and spaces remain the same (after reversal)
  implicit:
    - to decrypt, need to reverse the encryption
    - seems like digits are still reversed, but not changed to ASCII code

Examples:

  decrypt("'101''99''105''108''65'") == "Alice"
  decrypt("'98''111''66'") == "Bob"
  decrypt("30 71") == "17 03"

Data:

  input: string
  output: string

Algorithm:

  - CREATE a variable to contain the decription
    - initialize an empty array to contain all the letters in the message
      - decoded_msg = []
  - REPLACE each number in string to the correct letter
    - turn the string into an array with #split
      - str.split
    - put each number into the message array
      - decoded_msg << ()
    -iterate over each number in the message array, replacing it with its correct letter
      - decoded_msg.map! { |num| num.chr  }
  - TRANSFORM the string to the correct order (reversed)
    - reverse the message string
      - decoded_msg.reverse
  - RETURN the decoded message
    - join the message array to see the message
      - decoded_msg.join

Code:

  - Integer#chr -> returns the corresponding ASCII character represented by the integer
    - 65.chr => 'a'
    - 66.chr => 'b'

=end

require 'pry'

def decrypt(str)
  decrypted_msg = []
  
  numbers = str.split("''") 

  numbers.each do |letter|
    if letter.empty?
      next
    elsif letter.to_i.to_s == letter
      if (letter.to_i >= 65 && letter.to_i <= 90) || (letter.to_i >= 97 && letter.to_i <= 122)
        decrypted_msg << letter.to_i.chr
      else
        decrypted_msg << letter
      end
    else
      decrypted_msg << letter
    end
  end

  decrypted_msg.join.reverse
end

p decrypt("'101''99''105''108''65'") #== "Alice"
p decrypt("'98''111''66'") #== "Bob"
p decrypt("30 71") #== "17 03"
p decrypt("4'119''101''114''68' '115''105' '101''109''97''110' '121''77'9") #== "9My name is Drew4"
p decrypt("'98''121''102''84'5'68'87") #== "78D5Tfyb"
p decrypt("12'65'34''66'56'67'") #== "C65B43A21"
p decrypt("65") #== "56"
p decrypt("'65'") #== "A"
p decrypt("'86''101''121''119''82''65''70''89''83''90'86'109'4'65'8'102' 7'101''119''69''81''97''97''107''107''102'7'112''88''103'9'84''120''69'0'101''103''73''107''102''82''78''100''78'3'108''114''98''121''71''77'8'118''116''112''74''107''68'0'117''120''106'") #== "jxu0DkJptv8MGybrl3NdNRfkIge0ExT9gXp7fkkaaQEwe7 f8A4m68ZSYFARwyeV"

# Actual Solution:

def decrypt str
  str.gsub(/'\d+'/) { |code| code.delete("'").to_i.chr }.reverse
end

# Uses a regex: /'\d+'/

=begin

/   : Delimiters for the regular expression.
'   : Matches the character ' literally.
(   : Denotes the beginning of a capturing group. In this case, it's capturing one or more digits.
\d+ : Represents one or more digits. \d is a shorthand character class for any digit (equivalent to [0-9]), and + means one or more occurrences.
)   : Denotes the end of the capturing group.
'   : Matches the character ' literally.
/   : Closing delimiter for the regular expression.

=end
