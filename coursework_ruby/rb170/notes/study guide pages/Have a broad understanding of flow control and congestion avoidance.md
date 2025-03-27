### Flow Control

Prevents the sender from overwhelming the receiver with more data than it can process. The TCP header's WINDOW field allows each side to inform the other about how much data it can accept. It the receiver's buffer is filling up, it can reduce the advertised window size, causing the sender to slow down. This mechanism operates end-to-end and doesn't directly address network congestion. 

### Congestion Avoidance

Congestion avoidance aims to prevent overwhelming the network itself. TCP uses several mechanisms:
1. Congestion window (cwnd): TCP maintains a congestion window, limiting the amount of unacknowledged data in the network.
2. Slow Start: TCP starts with a small CWND and doubles it with each successful round trip, quickly ramping up to available bandwidth.
3. Congestion Detection: TCP infers congestion primarily through:
	1. Packet loss (either through timeouts or duplicate ACKs)
	2. Increased round-trip times (RTTs)
4. Congestion Response: When congestion is detected, TCP reduces its sending rate by decreasing the CWND, often by half.
5. Additive Increase/Multiplicative Decrease (AIMD): After reducing the cwnd, TCP then slowly increases it again, probing for available bandwidth.

These mechanisms work together to optimize data transfer rates while avoiding both receiver overload and network congestion.