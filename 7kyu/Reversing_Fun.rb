=begin

https://www.codewars.com/kata/566efcfbf521a3cfd2000056/train/ruby

You are going to be given a string. Your job is to return that string in a certain order that I will explain below:

Let's say you start with this: "012345"

The first thing you do is reverse it:"543210"
Then you will take the string from the 1st position and reverse it again:"501234"
Then you will take the string from the 2nd position and reverse it again:"504321"
Then you will take the string from the 3rd position and reverse it again:"504123"

Continue this pattern until you have done every single position, and then you will return the string you have created. For this particular number, you would return:"504132"

Input:
A string of length 1 - 1000

Output:
A correctly reordered string.

Problem:

  explicit:
    - given a string, arrange it into the correct order
    - correct order:
      - reverse the string
      - lock the char in 1st position and reverse again
      - lock the next char and reverse again
      - repeat until reaching last position
    - strings are 1-1000 chars long
  implicit:
    - 

Examples:

	reverse_fun('012') == '201'
	reverse_fun('012345') == '504132'
	reverse_fun('0123456789') == '9081726354'
	reverse_fun('Hello') == 'oHlel'
  reverse_fun("4ppso1vdjc9rjyf5bkmd5nztr8") == "84rptpzsno51dvmdkjbc59fryj"

Data:

  Input: string
  Output: string

Algorithm:

  - Create a placeholder for the ordered string
    - reordered_string = []
  - Transform the string to a reversed order
    - n.chars
    - n.reverse
  - Remove the first element and add it to the placeholder
    - reordered_string << n.shift
  - Repeat the process until there are no more characters
    - loop do 
        break if n.empty?
      end
  - Return the reordered string
    - reordered_string.join

Code:

  - Use a loop
    - until `n` is empty

=end

def reverse_fun(n)
  reordered_string = []
  characters = n.chars

  n.size.times { reordered_string << characters.reverse!.shift }

  reordered_string.join
end

p reverse_fun('012') == '201'
p reverse_fun('012345') == '504132'
p reverse_fun('0123456789') == '9081726354'
p reverse_fun('Hello') == 'oHlel'
p reverse_fun("4ppso1vdjc9rjyf5bkmd5nztr8") == "84rptpzsno51dvmdkjbc59fryj"
