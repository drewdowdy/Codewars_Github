=begin
https://www.codewars.com/kata/53bb1201392478fefc000746

Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty), example:

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 
Write method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.

=== PROBLEM ===

Write a method that returns the keys that are the names of suspects who have an integer in their key array that is NOT inside a given array of allowed numbers.

Rules:
  - If pockets are empty or nil, return nil
  - Given array is ALLOWED numbers

=== EXAMPLES ===

find_suspects(pockets, [1, 2]) # => [:tom, :jane]
  iterate over the `pockets` hash
    bob: [1] -> Does Bob have any un-allowed nums? -> No...
    tom: [2, 5] -> Does Tom have any un-allowed nums? YES -> select
    jane: [7] -> Does Tom have any un-allowed nums? -> YES -> select
  return the selected suspects
=> [:tom, :jane]

=== DATA ===

input:
  - a hash where keys are names and the values are arrays that are the pockets of the person
  - an array of allowed contents of pockets
intermeditate:
  - hash iteration
output: an array of keys that are the names of people who have un-allowed numbers in their value array


=== ALGORITHM ===

RETURN nil if all the input pockets are empty OR equal nil
ITERATE over the pockets hash (#select)
  skip the pocket if it's nil
  ITERATE over the current pocket (#any?)
    return true if the current number in pocket is NOT included in the allowed nums array
  END
END
RETURN nil if there are no suspects after selection
RETURN the keys of the slection (#keys)

=end

def find_suspects(pockets, allowed_items)
  return nil if pockets.values.all?{ |pocket| pocket == nil || pocket.empty? }

  suspects = pockets.select do |name, pocket|
    next if pocket == nil
    pocket.any? do |num|
      !allowed_items.include?(num)
    end
  end

  return nil if suspects.empty?

  suspects.keys
end

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

p find_suspects(pockets, [1, 2]) # => [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) # => nil
p find_suspects(pockets, []) # => [:bob, :tom, :jane]
p find_suspects(pockets, [7]) # => [:bob, :tom]

empty_pockets = {
  bob: [],
  tom: [],
  jame: []
}

p find_suspects(empty_pockets, [1, 2, 3])
