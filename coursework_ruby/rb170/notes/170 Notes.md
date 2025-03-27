![Diagram comparing OSI model layers with TCP/IP layers](https://da77jsbdz4r05.cloudfront.net/images/ls170/layered-system-osi-tcp-ip-comparison.png)

#### Netstat
https://www.lifewire.com/using-netstat-command-on-mac-4176069

### Command Line Tools

[curl](http://curl.haxx.se/) is a free command line tool that is used to issue HTTP requests.

```cmd
$ curl www.google.com
```

GET Requests
```cmd
$ curl -X GET "https://www.reddit.com/" -m 30 -v
```
- GET requests are used to retrieve a resource, and most links are GETs.
- The response from a GET request can be anything, but if it's HTML and that HTML references other resources, your browser will automatically request those referenced resources. A pure HTTP tool will not.

POST Requests
```cmd
$ curl -X POST "https://echo.epa.gov" -m 30 -v
```
### HTTP Requests
RapidAPI

### Inspector
Use the chrome inspector

### HTTP Codes

| Status Code | Status Text           | Meaning                                                                                       |
| ----------- | --------------------- | --------------------------------------------------------------------------------------------- |
| 200         | OK                    | The request was handled successfully.                                                         |
| 302         | Found                 | The requested resource has changed temporarily. Usually results in a redirect to another URL. |
| 404         | Not Found             | The requested resource cannot be found.                                                       |
| 500         | Internal Server Error | The server has encountered a generic error.                                                   |

RESPONSE Headers

|Header Name|Description|Example|
|---|---|---|
|Content-Encoding|The type of encoding used on the data.|Content-Encoding: gzip|
|Server|Name of the server.|Server:thin 1.5.0 codename Knife|
|Location|Notify client of new resource location.|Location: [https://www.github.com/login](https://www.github.com/login)|
|Content-Type|The type of data the response contains.|Content-Type:text/html; charset=UTF-8|

### Statefulness
Approaches to Stateful Apps:
- Sessions
- Cookies
- Asynchronous JavaScript calls, or AJAX

### Telnet
Used to explore HTTP

Request
```cmd
$ telnet example.com 80
GET / HTTP/1.1
Host: example.com

```

### [[Netcat]]
A network utility with many features
We will use to create TCP connections

### [[Education/Launch_School/rb170/BASH]]
Additional bash commands

### Security
The key points to remember about the TLS Handshake process is that it is used to:

- Agree which version of TLS to be used in establishing a secure connection.
- Agree on the various algorithms that will be included in the cipher suite.
- Enable the exchange of symmetric keys that will be used for message encryption.