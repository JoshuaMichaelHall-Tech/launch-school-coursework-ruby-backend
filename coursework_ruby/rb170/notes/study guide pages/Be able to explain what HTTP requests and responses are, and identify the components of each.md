HTTP (Hypertext Transfer Protocol) facilitates communication between clients and servers on the web. This communication consists of requests from clients and responses from servers.

HTTP Request
1. Request line: contains the HTTP method (e.g., GET, POST), the request target (usually a URL), and the HTTP version.
2. Headers: Provide additional information about the request (e.g., Accept, User-Agent, Content-Type).
3. Empty Line: Separates headers from the body.
4. Body (optional): Contains data sent to the server (e.g., from data in a POST request).

Example:
```
GET /index.html HTTP/1.1  
Host: [www.example.com](http://www.example.com/)  
User-Agent: Mozilla/5.0  
Accept: text/html
```

HTTP Response
1. Status line: Includes the HTTP version, a status code (e.g., 200, 404), and a reason phrase.
2. Headers: Provide additional information about the response (e.g., Content-Type, Content-Length).
3. Empty line: Separates headers from the body.
4. Body (optional): Contains the requested resource or error message.

Example:
```
HTTP/1.1 200 OK  
Content-Type: text/html  
Content-Length: 1234  
  
`<!DOCTYPE html>`  
<html>  
...
```

Both requests and responses can have multiple headers and may or may not include a body, depending on the nature of the communication.