# LS170: Networking Foundations - Study Guide

## Critical Networking Concepts

### 1. Internet Structure
- **Physical Components**: Routers, switches, servers, cables, etc.
- **Logical Components**: IP addresses, domains, protocols
- **Network Types**: LANs, WANs, and how they interconnect
- **Data Flow**: How information travels across networks
- **Network Models**: TCP/IP vs. OSI layers and their functions

### 2. Protocol Layers
- **Link Layer**: MAC addressing, frames, Ethernet
- **Internet Layer**: IP addressing, routing, packet forwarding
- **Transport Layer**: TCP, UDP, ports, sockets
- **Application Layer**: HTTP, DNS, FTP, etc.
- **Protocol Interactions**: How layers work together
- **Encapsulation**: How data is wrapped and unwrapped between layers

### 3. HTTP Protocol
- **Request/Response Cycle**: Client-server communication pattern
- **Message Structure**: Headers, body, and status lines
- **Methods**: GET, POST, PUT, DELETE, etc.
- **Status Codes**: Categories and common codes
- **Headers**: Common request and response headers
- **Content Negotiation**: How clients and servers agree on response format

### 4. URLs and Resources
- **URL Components**: Scheme, host, port, path, query, fragment
- **URL Encoding**: Special character handling
- **Resource Identification**: How URLs map to resources
- **REST Principles**: Resource-oriented design

### 5. Network Security
- **TLS/SSL**: Encrypted communication
- **HTTPS**: HTTP over TLS/SSL
- **Authentication**: Common mechanisms
- **Common Threats**: MITM attacks, session hijacking, etc.
- **Security Headers**: Protecting web applications

## Key Areas of Focus

### IP Addressing
- **IPv4 vs. IPv6**: Format, size, and adoption
- **Subnetting**: Network segmentation
- **Public vs. Private IPs**: Ranges and uses
- **NAT**: Network Address Translation
- **DHCP**: Dynamic address assignment

### TCP vs UDP
- **Connection-Oriented vs. Connectionless**: When to use each
- **Reliability Mechanisms**: Acknowledgments, retransmissions
- **Flow Control**: Preventing sender/receiver mismatch
- **Congestion Control**: Preventing network overload
- **Use Cases**: Which protocol for which applications

### DNS System
- **Hierarchy**: Root, TLD, authoritative servers
- **Resolution Process**: How domain names become IP addresses
- **Record Types**: A, AAAA, CNAME, MX, etc.
- **Caching**: How DNS optimizes performance
- **Common Issues**: Propagation delays, misconfiguration

### HTTP Methods
- **GET vs. POST**: Differences and appropriate uses
- **Idempotent Methods**: Safe operations (GET, HEAD)
- **Unsafe Methods**: State-changing operations (POST, PUT, DELETE)
- **RESTful Usage**: Proper method selection
- **Method Overriding**: Working within browser limitations

### Status Codes
- **2xx Success**: Normal operation
- **3xx Redirection**: Resource moved or alternate
- **4xx Client Error**: Bad requests, unauthorized
- **5xx Server Error**: Internal issues
- **Specific Codes**: When to use common codes

### State Management
- **HTTP Statelessness**: Implications for web applications
- **Cookies**: Client-side state storage
- **Sessions**: Server-side state tracking
- **Token-Based Auth**: JWTs and other approaches
- **Local Storage**: Modern alternatives

### Security
- **Common Threats**: CSRF, XSS, MITM, etc.
- **TLS Handshake**: How secure connections are established
- **Certificate Verification**: Trust chains
- **Secure Cookies**: HttpOnly, Secure flags
- **CORS**: Cross-Origin Resource Sharing

## Practical Skills

### Command-Line Tools
- **Using ping, traceroute**: Network connectivity testing
- **Using curl**: Making HTTP requests
- **Using telnet, netcat**: Raw connections
- **Using nslookup, dig**: DNS inspection
- **Using wireshark, tcpdump**: Packet analysis

### HTTP Messages
- **Constructing valid requests**: Format and headers
- **Interpreting responses**: Status codes and headers
- **Content negotiation**: Accept headers
- **Authentication headers**: Basic, Bearer tokens
- **Debugging issues**: Common problems and solutions

### URL Analysis
- **Parsing components**: Breaking down complex URLs
- **Constructing proper URLs**: Building correct addresses
- **URL encoding**: When and how to encode characters
- **Relative vs. absolute URLs**: When to use each

### Security Implementation
- **HTTPS migration**: Moving from HTTP to HTTPS
- **Certificate management**: Types and validation
- **Security headers**: CSP, HSTS, etc.
- **Authentication systems**: Design and implementation
- **API security**: Tokens and authorization

### Network Analysis
- **Identifying bottlenecks**: Performance troubleshooting
- **Analyzing latency**: Sources of delay
- **Diagnosing connectivity issues**: Common failure points
- **Reading HTTP logs**: Debugging web applications
- **Monitoring network traffic**: Baseline and anomalies
