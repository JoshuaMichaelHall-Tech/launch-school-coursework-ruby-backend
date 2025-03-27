The TCP three-way handshake is the process by which TCP establishes a connection between a client and a server.

Purpose:
1. To synchronize sequence numbers for both sides of the connection.
2. To manage connection state, ensuring both parties are ready to communicate.
3. To agree on initial parameters like maximum segment size.

Steps:
1. Client sends a SYN (synchronize) segment with an initial sequence number (ISN) (SYN flag = 1)
2. Server responds with an SYN-ACK segment, acknowledging the client's SYN and sending its own SYN with its ISN (SYN flag = 1, ACK flag = 1)
3. Client responds with an ACK segment, acknowledging the server's SYN (ACK flag = 1)

This process establishes a full-duplex communication and must complete before any application data can be sent. It ensures both parties are ready to send and receive data, and helps prevent old or duplicate connections.