# LS170: Networking Foundations - Glossary

## Networking Concepts

**Internet**
: A vast network of networks comprised of physical infrastructure (devices, routers, cables) and protocols

**Protocol**
: Set of rules governing how data is transmitted between devices on a network

**TCP/IP Model**
: Conceptual model of internet communication layers (Link, Internet, Transport, Application)

**OSI Model**
: Seven-layer conceptual model for understanding network interactions (Physical, Data Link, Network, Transport, Session, Presentation, Application)

**IP Address**
: Numerical identifier for network devices (IPv4: e.g., 192.168.0.1, IPv6: e.g., 2001:0db8:85a3:0000:0000:8a2e:0370:7334)

**DNS**
: Domain Name System - translates domain names to IP addresses

**Packet**
: Unit of data transmitted over networks

**Header**
: Control information prepended to data in packets

**Payload**
: Actual data being transmitted in a packet

**Multiplexing**
: Combining multiple signals over a single channel

**Demultiplexing**
: Separating combined signals back to individual channels

**Port**
: Virtual endpoint for network communications, identified by number (0-65535)

**Socket**
: Combination of IP address and port

**Latency**
: Delay in data transmission, measured in milliseconds

**Bandwidth**
: Maximum data transfer capacity, measured in bits per second

## Web and HTTP

**HTTP**
: Hypertext Transfer Protocol - protocol for transferring hypertext

**URL**
: Uniform Resource Locator - address for web resources, containing scheme, host, port, path, and query string

**HTTP Method**
: Action to be performed on a resource (GET, POST, PUT, DELETE, etc.)

**Status Code**
: Three-digit response code indicating request outcome (e.g., 200 OK, 404 Not Found)

**Header**
: Metadata about HTTP requests and responses (e.g., Content-Type, User-Agent)

**Cookie**
: Small piece of data stored by browsers for maintaining state

**Session**
: Server-side storage of user state across multiple requests

**Statelessness**
: HTTP's lack of built-in state management between requests

**TLS/SSL**
: Security protocols for encrypted communication

**HTTPS**
: HTTP with added security layer (HTTP + TLS/SSL)

**Request/Response Cycle**
: Pattern of client requests and server responses that forms the foundation of HTTP communication

## TCP and UDP

**TCP**
: Transmission Control Protocol - connection-oriented, reliable data transfer

**UDP**
: User Datagram Protocol - connectionless, unreliable but fast data transfer

**Three-way Handshake**
: Process used by TCP to establish a connection (SYN, SYN-ACK, ACK)

**Flow Control**
: Mechanism to prevent overwhelming a receiver with too much data

**Congestion Control**
: Mechanism to prevent overwhelming the network

**Reliability**
: Guarantee of data delivery and correct ordering

**Segment**
: TCP Protocol Data Unit

**Datagram**
: UDP Protocol Data Unit

## Security

**Encryption**
: Process of encoding data to prevent unauthorized access

**Authentication**
: Verification of identity

**Integrity**
: Assurance that data has not been altered

**Public Key Infrastructure**
: System of digital certificates, certificate authorities, and other elements for secure communications

**Certificate**
: Digital document verifying the identity of a website or service

**Man-in-the-Middle Attack**
: Attack where a third party intercepts and potentially alters communications
