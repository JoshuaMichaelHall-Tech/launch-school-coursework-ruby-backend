We're receiving a set of messages in code. The messages are sets of text strings, like:
"alakwnwenvocxzZjsf"
Write a method to decode these strings into numbers. The decoded number should be the number of lowercase characters between the first two uppercase characters. If there aren't two uppercase characters, the number should be 0.

Test cases:
p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
p decode([]) == []