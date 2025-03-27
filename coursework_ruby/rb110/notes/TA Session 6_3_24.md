// # Write a function, `negate`, that converts all `“yes”` words to `"no"` and `"no"` words to `"yes"` in a sentence. The comparison for `"yes"` and `"no"` should be case insensitive.`"yes"` and `"no"` should be negated even if ending with `.`, `?`, `,`, or `!`. -- Michael

  

// Test cases

console.log(negate("Yes, I said no but now I say yes.")); // "No, I said yes but now I say no."

console.log(negate("no way, yes way!")); // "yes way, no way!"

console.log(negate("Yesterday is not today?")); // "Yesterday is not today?"

console.log(negate("No, I do not know!")); // "Yes, I do not know!"

  

// Implement a function, capitalize, that capitalizes all words in a sentences. However, only capitalize if the word is followed by a word starting with a vowel (for Ruby don’t use capitalize). -- Udeshika

  

// Test cases

console.log(capitalize("hello apple world")); // "Hello apple world"

console.log(capitalize("this is an umbrella")); // "This Is An umbrella"

console.log(capitalize("every vowel starts an echo")); // "every vowel Starts An echo"

console.log(capitalize("under the oak tree")); // "under The oak tree"

console.log(capitalize("a quick brown fox")); // "a quick brown fox"

  

// Write a function, snakecase, that transforms each word in a sentence to alternate between lower (even index value) and upper (odd index value) cases when the word before or after it  begins with "s". -- Joshua

  

// Test cases

console.log(snakecase("Snakes slither silently")); // "sNaKeS sLiThEr sIlEnTlY"

console.log(snakecase("simple sentence structure")); // "sImPlE sEnTeNcE sTrUcTuRe"

console.log(snakecase("apples are sweet")); // "apples aRe sweet"

console.log(snakecase("swiftly swimming swans")); // "sWiFtLy sWiMmInG sWaNs"

console.log(snakecase("the sun sets slowly")); // "tHe sUn sEtS sLoWlY"

console.log(snakecase("A quick brown fox")); // "A quick brown fox"

  

// Write a function that returns the maximum possible consecutive alternating odd and even (or even and odd) numbers. Minimum possible length is 2. If there’s none return []. -- Will

  

// Test cases

console.log(longestAlternatingSubarray([1, 2, 3, 4, 5, 6])); // Expected: [1, 2, 3, 4, 5, 6]

console.log(longestAlternatingSubarray([2, 4, 6, 8])); // Expected: []

console.log(longestAlternatingSubarray([1, 3, 5, 7])); // Expected: []

console.log(longestAlternatingSubarray([1, 1, 3, 7, 8, 5])); // Expected: [7, 8, 5]

console.log(longestAlternatingSubarray([4, 6, 7, 12, 11, 9, 17])); // Expected: [6, 7, 12, 11]