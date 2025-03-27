URL encoding is a method of converting characters into a format that can be transmitted over the internet. It replaces unsafe ASCII characters with a '%' symbol followed by two hexadecimal digits representing the character's ASCII code.

URL encoding is used when:

1. A character has no corresponding character within the standard ASCII character set. Example: The Euro symbol '€' is encoded as '%E2%82%AC'
2. The character is unsafe because it could be misinterpreted or modified by some systems. Example: The space character ' ' is often encoded as '%20'
3. The character is reserved for special use within the URL scheme. Example: The '&' is encoded as '%26' when used in a query string

URL encoding ensures that all browsers and web servers can correctly interpret and process URLs, regardless of the letters they contain. This is particularly important for non-English languages and special characters in query strings.