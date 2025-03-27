PROBLEM
Encrypt Text Strings
Replace each letter with another letter n positions away

EXAMPLES
Cipher class
-rotate(string, rotation)

- only replace letters, maintain case, start over when at end of alphabet

DATA
uppercase double alphabet array
lowercase double alphabet array

ALGORITHM
rotation = rotation % 26
