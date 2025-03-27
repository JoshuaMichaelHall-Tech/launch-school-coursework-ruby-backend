# LS170: Networking Foundations - Reference Sheet

## Network Diagnostic Tools

```bash
# Test connectivity
ping example.com

# Trace route to destination
traceroute example.com    # Unix/Linux/macOS
tracert example.com       # Windows

# DNS lookup
nslookup example.com
dig example.com

# View network interfaces
ifconfig                  # Unix/Linux/macOS
ipconfig                  # Windows

# Check open connections
netstat -an
ss -tuln                  # Linux alternative to netstat
```

## HTTP Requests with curl

```bash
# Basic GET request
curl www.example.com

# Verbose GET request showing headers and protocol details
curl -X GET "https://www.example.com/" -m 30 -v

# POST request
curl -X POST "https://example.com/api" -m 30 -v

# POST with data
curl -X POST "https://example.com/api" -d "param1=value1&param2=value2"

# POST with JSON data
curl -X POST "https://example.com/api" \
  -H "Content-Type: application/json" \
  -d '{"key1":"value1", "key2":"value2"}'

# Include cookies
curl -X GET "https://example.com" --cookie "name=value"

# Follow redirects
curl -L "https://example.com"
```

## Using Telnet for HTTP

```bash
# Connect to a server
telnet example.com 80

# Send HTTP request
GET / HTTP/1.1
Host: example.com

# Leave a blank line to send the request (press Enter twice)
```

## Using Netcat (nc)

```bash
# Connect to a server (client mode)
nc -v google.com 80

# Create a simple server (listening mode)
nc -lvp 2345

# Send HTTP request via netcat
echo -e "GET / HTTP/1.1\r\nHost: example.com\r\n\r\n" | nc example.com 80
```

## URL Components

```
https://www.example.com:443/path/to/resource?param1=value1&param2=value2#section

scheme    = https
host      = www.example.com
port      = 443
path      = /path/to/resource
query     = param1=value1&param2=value2
fragment  = section
```

## HTTP Methods

```
GET     - Retrieve data
POST    - Submit data to be processed
PUT     - Update a resource
DELETE  - Remove a resource
HEAD    - Same as GET but without response body
OPTIONS - Get supported methods for a resource
PATCH   - Partially update a resource
```

## Common HTTP Status Codes

```
# Informational (1xx)
100 Continue

# Success (2xx)
200 OK
201 Created
204 No Content

# Redirection (3xx)
301 Moved Permanently
302 Found (Temporary Redirect)
304 Not Modified

# Client Error (4xx)
400 Bad Request
401 Unauthorized
403 Forbidden
404 Not Found
422 Unprocessable Entity

# Server Error (5xx)
500 Internal Server Error
502 Bad Gateway
503 Service Unavailable
504 Gateway Timeout
```

## Common HTTP Headers

```
# Request Headers
Host: example.com
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)
Accept: text/html,application/xhtml+xml
Accept-Language: en-US,en;q=0.9
Cookie: sessionid=abc123
Cache-Control: no-cache
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5c...

# Response Headers
Content-Type: text/html; charset=UTF-8
Content-Length: 1234
Set-Cookie: sessionid=abc123; Path=/; HttpOnly
Cache-Control: max-age=3600
Location: https://example.com/new-page
Server: nginx/1.18.0
```

## TCP Three-Way Handshake

```
1. Client sends SYN packet to server
   [Client] SYN --> [Server]

2. Server responds with SYN-ACK
   [Client] <-- SYN-ACK [Server]

3. Client acknowledges with ACK
   [Client] ACK --> [Server]

Connection established
```

## TLS Handshake

```
1. Client Hello (with supported cipher suites)
   [Client] --> [Server]

2. Server Hello (with selected cipher suite and certificate)
   [Client] <-- [Server]

3. Client verifies certificate, sends key exchange information
   [Client] --> [Server]

4. Both sides generate session keys
   [Client] <-- [Server]

5. Finished messages
   [Client] <--> [Server]

Secure connection established
```
