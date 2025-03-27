### HTTP Codes

HTTP status codes are three-digit numbers included in a server's response to a client's request. They indicate the outcome of the request, helping both the client (e.g., web browser) and developers understand what happened.

Status codes are grouped into five classes:

1. 1xx (Informational): Request received, continuing process
2. 2xx (Successful): The request was successfully received, understood, and accepted
3. 3xx (Redirection): Further action needs to be taken to complete the request
4. 4xx (Client Error): The request contains bad syntax or cannot be fulfilled
5. 5xx (Server Error): The server failed to fulfill a valid request

Examples:

| Status Code | Status Text           | Meaning                                                                                       |
| ----------- | --------------------- | --------------------------------------------------------------------------------------------- |
| 200         | OK                    | The request was handled successfully.                                                         |
| 302         | Found                 | The requested resource has changed temporarily. Usually results in a redirect to another URL. |
| 404         | Not Found             | The requested resource cannot be found.                                                       |
| 500         | Internal Server Error | The server has encountered a generic error.                                                   |

Clients use these codes to determine how to handle the response (e.g., display content, rdirect, show an error). Developers use them for debugging and to implement appropriate error handling in their applications.