Transmission Control Protocol (TCP) and User Datagram Protocol (UDP) are both transport layer protocols that provide multiplexing, allowing multiple applications on a device to use network resources simultaneously.

Similarities:
- Both provide multiplexing through the use of ports
- Both use checksums for error detection

TCP
- Connection-oriented: establishes a connection using a three-way handshake before data transfer
- Reliable: ensured data delivery through acknowledgements and retransmission of lost packets
- In-order delivery: packets are delivered in the order they were sent
- Flow control and congestion avoidance: manages data flow to prevent overwhelming the receiver or network
- Downsides: higher latency due to connection establishment and potential head-of-line blocking

UPD
- Connectionless: sends data without establishing a connection first
- Simple and lightweight: minimal protocol overhead
- No guaranteed delivery, ordering, or duplicate protection
- No flow control or congestion avoidance
- Advantages: Lower latency, higher speed, and more flexibility for applications to implement their won reliability mechanisms if needed

TCP is typically used for applications requiring reliable data transfer (e.g., web browsing, email), while UDP is often used for real-time applications that can tolerate some data loss (e.g., video streaming, online gaming).
