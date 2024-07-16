=begin
https://www.codewars.com/kata/5a4b612ee626c5d116000084

Imagine a funnel filled with letters. The bottom letter drops out of the funnel and onto a conveyor belt:

  \b,c/  -->   \b,c/
   \a/   -->    \ /
                 a
-------     -------
If there are two letters above a gap, the smaller letter falls into the gap.

  \b,c/   -->   \  c/ 
   \ /    -->    \b/   
a            a         
-------      -------
Of course, this can create a new gap, which must also be filled in the same way:

  \f,e,d/  -->  \f, ,d/
   \  c/   -->   \e,c/ 
    \b/           \b/   
   a            a         
  -------      -------
Once all the gaps above it have been filled, the bottom letter drops out of the funnel and onto the conveyorbelt. The process continues until all letters have fallen onto the conveyor. (New letters fall onto the end of the existing string)

KATA GOAL: Return the string on the conveyorbelt after all letters have fallen.

\f, ,d/      \f, ,d/   --> etc -->    \     /
 \e,c/        \e,c/    --> etc -->     \   /
  \b/    -->   \ /     --> etc -->      \ /
a           a   b                   abcdef
-------     -------                 -------
All letters in the funnel will be unique i.e. in every comparison one letter will be strictly smaller than the other. The funnel will be presented as a nested list, e.g:

[["d","a","c"],
   ["b","e"],
     ["f"]]
The value of a letter is defined by its codepoint. Note: this means all capital letters are defined as smaller than all lower-case letters, but your language's comparison operator will probably treat it that way automatically.

The funnels will always be "nice" -- every layer will have 1 item more than the layer below, and every layer will be full, and generally there's no funny business or surprises to consider. The only characters used are standard uppercase and lowercase letters A-Z and a-z. The tests go up to 9 layer funnel.

Fully Worked Example
\d,a,c/      \d,a,c/      \d,a,c/ -->  \d   c/     
 \b,e/        \b,e/  -->   \  e/  -->   \a,e/
  \f/   -->    \ /   -->    \b/          \b/  --> 
                f        f            f
------      -------      -------      -------


\d   c/      \d   c/ -->  \    c/      \    c/     
 \a,e/  -->   \  e/  -->   \d,e/        \d,e/  -->
  \ /   -->    \a/          \a/   -->    \ /   -->
f  b        fb           fb           fb  a
------      -------      -------      -------


 \    c/      \    c/      \    c/ -->  \     /     
  \  e/        \  e/  -->   \   /  -->   \  c/   
   \d/   -->    \ /   -->    \e/          \e/  -->
fba          fba d       fbad          fbad
-------      -------     --------      -------


  \     /      \     /      \     /
   \  c/  -->   \   /        \   / 
    \ /          \c/   -->    \ /   
fbad e       fbade        fbadec         
-------      -------      -------

DONE. Return "fbadec".

=== PROBLEM ===

Write a method that takes a nested array, where each subarray is some level of a funnel. Return the resulting string of all the letters 'falling through' the filter

Rules:
  - When a letter falls through, the smaller letter from the next level up takes its place
  - Letter 'size' is determined by its codepoint
    - Letter Order:
    ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
  - Each subarry will only be 1 element bigger than the succeeding one
  - Every subarray will be full
  - The funnel will only contain unique letters a-z (in any case)
  - Program should account for up to a 9 layer filter
  - When there is a gap, only compare the 2 spots 'above' the gap, not the whole level

=== DATA ===

input: a nested array where each subarray is a layer of a filter
intermediate:
  - sorting (to determine smallest letter)
  - strings of letters
  - arrays
  - result string
output: the resulting string of all the letter elements of the input array 'falling though' the nested array filter

funnel_out([["a","e","c","f"],["d","i","h"],["j","g"],["b"]]) == "bghcfiejda"

=== ALGORITHM ===

INITIALIZE a variable 'result' to reference an empty string
REVERSE the input array
ITERATE over the reversed input array until all subarrs contain all spaces ' '
  add letter from 1st subarr to result
  #reorder the whole funnel array
END
RETURN the result

#reorder(funnel)
ITERATE over the nested array with index (#each_with_index)
  Iterate over the subbar with index (#each_with_index)
    IF the current letter is ' '
      IF funnel[subarr + 1][letter] is a space
        swap current space for funnel[subarr + 1][letter + 1]
      IF funnel[subarr + 1][letter + 1] is a space
        swap current space for funnel[subarr + 1][letter]
      IF funnel[subarr + 1][letter] < funnel[subarr + 1][letter + 1]
        swap current space for funnel[subarr + 1][letter]
      IF funnel[subarr + 1][letter] > funnel[subarr + 1][letter + 1]
        swap current space for funnel[subarr + 1][letter + 1]
      END
    END
  END
END

=== DEBUG ===

When comparing, we can't compare a space to a letter
  ' ' is always less than any letter
Need to check if any letters in upper layers are spaces FIRST

=end

def reorder(funnel)
  reversed = funnel.reverse

  reversed.each_with_index do |subarr, sub_idx|
    next if sub_idx == reversed.size - 1
    subarr.each_with_index do |letter, let_idx|
      if letter == ' '
        if reversed[sub_idx + 1][let_idx] == ' '
          reversed[sub_idx][let_idx], reversed[sub_idx + 1][let_idx + 1] = reversed[sub_idx + 1][let_idx + 1], reversed[sub_idx][let_idx]
        elsif reversed[sub_idx + 1][let_idx + 1] == ' '
          reversed[sub_idx][let_idx], reversed[sub_idx + 1][let_idx] = reversed[sub_idx + 1][let_idx], reversed[sub_idx][let_idx]
        elsif reversed[sub_idx + 1][let_idx] < reversed[sub_idx + 1][let_idx + 1]
          reversed[sub_idx][let_idx], reversed[sub_idx + 1][let_idx] = reversed[sub_idx + 1][let_idx], reversed[sub_idx][let_idx]
        elsif reversed[sub_idx + 1][let_idx] > reversed[sub_idx + 1][let_idx + 1]
          reversed[sub_idx][let_idx], reversed[sub_idx + 1][let_idx + 1] = reversed[sub_idx + 1][let_idx + 1], reversed[sub_idx][let_idx]
        end
      end
    end
  end

  reordered = reversed.reverse
end

p reorder([["a","e","c","f"],["d","i","h"],["j","g"],[" "]]) #== [["a","e"," ","f"],["d","i","c"],["j","h"],["g"]]

def funnel_out(funnel)
  funnel = funnel.dup
  result = ''

  loop do
    break if funnel.all? { |subarr| subarr.all? { |e| e == ' ' } }
    result
    result << funnel[-1][0]
    funnel[-1][0] = ' '
    funnel = reorder(funnel)
  end

  result
end

p funnel_out([["q"]]) == "q"
p funnel_out([["b","c"],["a"]]) == "abc"
p funnel_out([["d","a","c"],["b","e"],["f"]]) == "fbadec"
p funnel_out([["a","e","c","f"],["d","i","h"],["j","g"],["b"]]) == "bghcfiejda"
