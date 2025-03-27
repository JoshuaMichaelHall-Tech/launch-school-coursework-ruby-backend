=begin

Implement a function that calculates the sum of numbers inside of a string.

  

You can expect that the string will include only positive numbers.

  

sum_of_numbers("L12aun3ch Sch3oo451") = 469

sum_of_numbers("HE2LL3O W1OR5LD") == 11

sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

=end

=begin

For Jack:

Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.

  

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2

p minSubLength([1, 10, 5, 2, 7], 9) == 1

p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4

p minSubLength([1, 2, 4], 8) == 0

  

=end

  

=begin

Given two words, how many letters do you have to remove from them to make them anagrams?

  

anagram_difference('', '') == 0

anagram_difference('a', '') == 1

anagram_difference('', 'a') == 1

anagram_difference('ab', 'a') == 1

anagram_difference('ab', 'ba') == 0

anagram_difference('ab', 'cd') == 4

anagram_difference('aab', 'a') == 2

anagram_difference('a', 'aab') == 2

anagram_difference('codewars', 'hackerrank') == 10

anagram_difference("oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau", "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw") == 42

anagram_difference("fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo", "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt") == 50

=end

a = [['a', 'b'], ['c', 'd'], ['e', 'f']]

create a deep copy of this collection
  

b = a.map do |subarr|

  # 1st subarr is ['a', 'b']

  subarr.map do |char|

    #1st char is 'a'

    char.dup

  end

end

  

=begin

You might also find it helpful to try combining the collection methods you've learned in 110: for each, map, select, any?, all?, and sort , try writing code combining every possible pair to perform some task. For instance, this code tells us whether there are any pet owners who always give their pets long names:

=end

pet_owners = { alice: ['smokey', 'stretch', 'jenny'], bob: ['skip'], carol: ['rocky', 'pogo'] }

  

puts (pet_owners.any? do |_, pets|

  pets.all? { |pet| pet.length > 4 }

end)