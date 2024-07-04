# https://www.codewars.com/kata/59590976838112bfea0000fa

# Born a misinterpretation of this kata, your task here is pretty simple: given an array of values and an amount of beggars, you are supposed to return an array with the sum of what each beggar brings home, assuming they all take regular turns, from the first to the last.

# For example: [1,2,3,4,5] for 2 beggars will return a result of [9,6], as the first one takes [1,3,5], the second collects [2,4].

# The same array with 3 beggars would have in turn have produced a better out come for the second beggar: [5,7,3], as they will respectively take [1,4], [2,5] and [3].

# Also note that not all beggars have to take the same amount of "offers", meaning that the length of the array is not necessarily a multiple of n; length can be even shorter, in which case the last beggars will of course take nothing (0).

# Note: in case you don't get why this kata is about English beggars, then you are not familiar on how religiously queues are taken in the kingdom ;)

# Note 2: do not modify the input array.

=begin

=== PROBLEM ===

Write a method that takes returns an array of n elements where the elements are the sums of each element from an input array divided between the n elements in the output

Rules:
  - Don't mutate input
  - If the n value is 0, return an empty array

=== EXAMPLES ===

beggars([1,2,3,4,5],3) == [5,7,3]
  create a hash where the keys are beggar_1, beggar_2, beggar_3
  {
  beggar_1=>0,
  beggar_2=>0,
  beggar_3=>0
  }
  create a copy of the input array
  until the copy of the array is empty...
    shift the first value from the copy and add it to the first beggar
  END
  return an array of all the values
=> [5, 7, 3]

=== DATA ===

input:
  - an array of numbers
  - an integer that is the number of elements in output array
intermediate:
  - a hash where the keys are the strings and the values are sums
output: an array that is the sums of the elements from the input array divided amongs the elements of this array

=== ALGORITHM ===

INITIALIZE a hash where the keys are strings of numbers n down to 1 and the default values are 0
CREATE a copy of the input array
UNTIL the copy is empty...
  ITERATE over the key-value pairs in hash
    - Remove the first element (#shift)
    - add to current value
  END
END
RETURN the values of the hash

=end

def beggars(values, n)
  return [] if n < 1
  copy = values.dup
  hash = Hash.new(0)

  1.upto(n).each { |num| hash[num.to_s] = 0 }

  until copy.empty?
    hash.keys.each do |beggar|
      next_num = copy.shift
      break if next_num == nil
      hash[beggar] += next_num
    end
  end
  
  hash.values
end

p beggars([1,2,3,4,5],1) #== [15]
p beggars([1,2,3,4,5],2) #== [9,6]
p beggars([1,2,3,4,5],3) #== [5,7,3]
p beggars([1,2,3,4,5],6) #== [1,2,3,4,5,0]
p beggars([1,2,3,4,5],0) #== []
