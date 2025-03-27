# How the Internet Works: The Internet Protocol Suite

In this article we will take a deep dive into the layers of the internet, working to build a mental model of how it works. The oldest and simplest model for understanding the layers of the Internet is the Internet Protocol Suite. This model is built on the Physical Layer, the foundation of all network communications.
## The Physical Layer
A network is a group of devices that communicate with each other. The internet is a vast network of networks. Billions of devices are connected to the internet today, and each device is able to communicate with other devices because they are all linked physically. The physical layer, the layer below the Internet Protocol Suite, is where this fundamental connection occurs.

In order for devices to communicate, they need a physical medium and a corresponding means of sending the actual signal. Mediums include copper wires, fiber optic cables, air, and even space. We send electrical impulses over copper wires, pulses of light through fiber optic cables, and electromagnetic waves through air and space. Regardless of the medium used, all signals are basically on or off, representing 0s or 1s. Each of these is a bit, and 8 bits make up a byte. All data is comprised of bits, 0s and 1s, from the simplest character in the alphabet to the most intense video game, everything is just a bunch of 0s and 1s!

The physical layer encompasses the hardware that directly handles these bits at their most basic level. This includes network interface cards (NICs), cables, connectors, repeaters, and the physical transmission medium itself. These components work together to convert data into physical signals and transmit them across the network. It is on top of this physical layer that the rest of the Internet Protocol Suite is built.

## The Internet Protocol Suite
The Internet Protocol Suite (the TCP/IP model) helps us understand how data gets from a computer somewhere out there on the internet to our screen when we enter a web address in the address bar of our search engine. Somehow, that address must be converted to bits across a wire to another part of the internet where another computer converts those bits into a request it can understand, then it must come up with an appropriate response, convert it into bits to send back across the internet, where our computer converts those bits back into something presentable to display on the screen. The TCP/IP model gives us a logical, step-by-step process for how this is accomplished.

Each layer in the TCP/IP model builds Protocol Data Units (PDUs) containing a payload with the data it is moving, a header, and sometimes, a trailer. These PDUs are encapsulated and passed down to the next lower layer as its payload. Levels do not have to concern themselves with what is in the payload, so they can take payloads from various upper level protocols and treat them all the same. This allows for greater versatility and compatibility over the internet.

## The Network (Link) Layer
The Network layer, also known as the Data Link Layer in some models, is the lowest layer in the model, and it is responsible for identifying devices on a local network, and moving data between those devices. Like the layers above, protocols at this layer accept an encapsulated PDU from the next layer up (in this case, the Internet Layer), as its payload. The most common protocol for communication at the Network Layer is Ethernet. Ethernet PDUs are called packets and are the lowest level PDUs. These packets are made up of structured bits that the physical layer transmits.

Like other PDUs, Ethernet packets contain a header and a payload. The header includes metadata in various fields, the most important of which for our understanding are the MAC address fields. These fields contain the physical device addresses of the sending and receiving devices on the network. MAC addresses are assigned to the Network Interfaces of each network-capable device when it is manufactured. When a device is connected to a network, other local devices can use that MAC address to send data to that device.

Early implementations of Ethernet involved hubs which allowed devices to broadcast data to every device on that local network. Devices would then ignore data not addressed to their particular MAC address. Modern local networks utilize switches that keep track of which device uses which MAC address, and forward data only to the specified device on the network.

Ethernet functions at the local network level. It is not scalable to the internet because MAC addresses are physical, not logical, they include no hierarchy, and MAC address tables would have to contain not only every MAC address for every device worldwide but also a list of connections between every device between source and destination devices, along with their MAC addresses! This is why we need the next layer, the Internet layer.

## The Internet Layer
Protocols at this layer facilitate communication between devices on different networks. Internet Protocol (IP) is the predominant protocol used at this layer, and there are currently two versions in use: IPv4 and IPv6. Both versions provide addressing and the ability to route data across networks. Another important protocol at this layer is ICMP (Internet Control Message Protocol), which handles error reporting and network diagnostics.

Internet Protocol PDUs are called packets, and their payload is a PDU from the Transport Layer. Packets contain several header fields, including the version field to show whether it is using IPv4 or IPv6, a TTL field which causes a lost packet to be dropped after it has made too many hops, a protocol field which indicates the Transport Layer protocol of its payload, a checksum field for verifying data integrity, and source and destination fields containing IP addresses.

IP addresses are logical and hierarchical. They are assigned to a device when the device joins a network, and show to which subnet they belong. Routers use IP addresses to direct packets between networks, using the address in a manner similar to how the post office uses mailing addresses. Post offices look first at the country, and forward mail to the correct country, then to the state, then the city, the street, and finally the house number. A logical hierarchy is necessary to direct mail, and in the same way a logical hierarchy is used to direct traffic over the internet. IP uses a process called subnetting to split networks into smaller subnets, and within those subnets, it can split them into further subnets, creating the hierarchy necessary for logical routing.

Routers are responsible for routing packets on their way to their destinations. They use routing tables to hold network addresses and determine which way to send packets based on those tables.

While IPv4 and IPv6 have the same purpose and some similarities, they are not the same. IPv6 does not include error checking, unlike IPv4, and its header structure is different. Also, the addresses themselves are very different. IPv4 addresses are 32-bit addresses made up of 4, 8-bit groups separated with a period (e.g. 192.168.0.1). There are about 4 billion IPv4 addresses, and the common belief is that they will eventually be depleted. So, to address the need for more addresses, IPv6 addresses are 128-bit addresses comprised of 8 groups of 4 hexadecimal digits separated by a colon (e.g. 2001:db8:3333:4444:5555:6666:7777:8888). There are approximately 340 undecillion (340,282,366,920,938,463,463,374,607,431,768,211,456) unique IPv6 addresses, enough to ensure that we never run out!

## The Transport Layer
While lower layers in the TCP/IP model can get data to a particular device, how does the device know which application to forward it to? Also, if data is lost or mixed up in transit, how does the device know how to request data to be resent or order data it receives out of order? These are the issues the Transport layer addresses. This layer is responsible for creating a direct connection between applications and providing reliable network communication.

If you run multiple programs on your computer at the same time, say you are listening to music on one, browsing the internet on another, and sending chat messages on a third, how does the computer know not to mix them up? After all, they are all using the same IP address and they share a MAC address. The solution is a process called multiplexing and demultiplexing. Various processes on a device are assigned a port number to distinguish them from other processes. This port number is appended to the end of the IP address to form a socket, an identifier unique to that process. Multiplexing enables multiple processes to send and receive data on the same link across the web, and demultiplexing allows the receiver to separate data streams when they arrive and send them to their appropriate processes.

There are two primary protocols that operate at the Transport level, Transmission Control Protocol (TCP), and User Datagram Protocol (UDP). Both use multiplexing, and both can verify that data has not been corrupted in transit via a checksum header (optional for UDP on IPv4). This checksum is a value derived from taking a hash of the payload before transmission. The receiving device then takes a hash of the payload and compares it with the checksum and if they are the same, the payload has not been compromised.

UDP only has four header fields: Source Port, Destination Port, Length, and Checksum. The length field tells the receiver how long the Datagram is. UDP is fast, efficient, and does not require a connection. It is used for applications where speed is of the essence and where data order or completeness is not necessary. Teleconferences, video games, and streaming movies are good use cases.

TCP offers several additional services. It is a connection-oriented protocol, establishing a connection before any data is transferred. It not only checks for data integrity, it also checks for missing data and resends it, and it puts the data in the proper order before handing it to the next layer up. It does this through the use of acknowledgments. When the server sends data to the client, for example, it will only send so many segments at a time. When it receives confirmation that a packet has been received, it sends another.

TCP uses a "sliding window" mechanism for flow control. The window size determines how many bytes can be sent before requiring an acknowledgment. The receiving device can adjust this window size up or down based on its capacity to process incoming data, effectively controlling the flow of data. When the sender receives an acknowledgment, the window "slides" forward, allowing more data to be sent. This system helps prevent both network congestion and receiver overflow.

Additionally, TCP offers solutions to ensure that data is sent at a rate that both the network and the receiving device can handle. Its congestion avoidance service tracks the number of resend requests and when they get too numerous, it slows down the transmission rate inferring that the network is dropping packets due to an overtaxing of the network. Its flow-control mechanism works on a WINDOW header sent back and forth between the two devices on the internet. Each device can tell the other to slow down the number of transmissions made before they are processed and a reply is sent.

## The Application Layer

The application layer is the last and topmost layer in the TCP/IP model. It is a set of protocols that provide communication services to applications. These protocols define message structure and data. Common protocols at this layer include: FTP for file transfer; SMTP, POP and IMAP for email; HTTP for web communication; TLS for securing HTTP, and DNS for mapping domain names (e.g. www.example.com) to IP addresses (e.g. 111.111.111.111). We will take a closer look at three of these protocols to understand how this layer contributes to a fully functioning internet.

DNS
When one types a URL into a web browser (e.g. www.examle.com), the browser must find the IP address of the site before it can send an HTTP request to the server to get the page. It does this through a DNS service. DNS maps domain names (like www.example.com) to IP addresses. There is a hierarchy of DNS servers, starting with root servers at the top, and moving to regional servers, then to local ISP servers (there are more levels of DNS servers, but you get the idea).  Once a site has been visited by a user, the DNS records for that site are stored in the browser for a period of time to prevent the need for looking up the IP address each time the site is visited. When DNS is used, a browser starts with its local device cache to find the IP address, if it doesn't find it, it works its way up the hierarchy until a match is found.

HTTP
While the internet is a network of networks, the web is an internet service for accessing resources that can be navigated via URLs (Uniform Resource Locator, e.g. www.example.com). These resources use a special language called HTML (Hypertext Markup Language) to enable cross platform communications. HTTP (Hypertext Transfer Protocol) provides the rules for transferring this HTML. These protocols allow us to pull up a website in a browser on a variety of different devices such as a Samsung TV, a Dell desktop computer, an Apple laptop, or an android smartphone. HTTP is used not only for loading HTML, but also for other resources like videos and images.

HTTP is a simple protocol used by user computers (clients) to request resources from special computers that host websites (servers). One HTTP request from a user computer and its corresponding response from a server is one cycle. Each cycle is independent from all other cycles. For this reason, HTTP is considered a stateless protocol, it does not keep track of any data information (like what items you have put in your digital cart). Developers have to use other techniques to simulate state (using session IDs, cookies, or AJAX, which are outside the scope of this article). HTTP is completely text-based, each request and response is made up entirely of text. 

On it's own, HTTP is not secure. There are many security threats involving HTTP. For example, malicious actors can read HTTP requests using packet sniffing software, including sensitive data like passwords and bank account numbers. To mitigate against this threat, there is another Application Layer protocol called TLS (Transport Layer Security) which when used in conjunction with HTTP is known as HTTPS.

TLS
TLS is a cryptographic protocol used in conjunction with HTTP to mitigate many security threats when accessing the web. TLS uses a handshake to establish a connection between applications on the client and the server.  It provides three basic services: encryption, authentication, and data integrity. Encryption is a way of making text look like gibberish. TLS encrypts data before sending it across the network, and then decrypts it on the other side. Authentication is verification of identity. Servers use certificates granted to them by certificate authorities through which the browser can verify their identity. Data integrity verifies that data has not been tampered with or corrupted in transit. Together, these services mitigate a host of security threats.

Conclusion
I hope this brief overview of how the Internet Protocol Suite works has helped you to understand


-----------

Refined by Claude.ai

# How the Internet Works: The Internet Protocol Suite

The Internet is a marvel of modern engineering that connects billions of devices worldwide. Understanding how it works requires examining its layered architecture, known as the Internet Protocol Suite or TCP/IP model. This article explores each layer of this architecture, from the physical foundations to the applications we use daily.

## The Physical Layer: The Foundation
At its most fundamental level, the Internet relies on physical connections between devices. While not officially part of the TCP/IP model, the physical layer forms the essential foundation for all network communications.

These physical connections can take various forms:
- Copper wires carrying electrical signals
- Fiber optic cables transmitting light pulses
- Air and space conducting electromagnetic waves

Regardless of the medium, all data transmitted across these connections consists of binary digits (bits) - sequences of 1s and 0s. Eight bits form a byte, and these fundamental units combine to represent everything from simple text messages to complex video streams.

The physical layer includes hardware components that handle these binary transmissions:
- Network Interface Cards (NICs)
- Cables and connectors
- Repeaters and physical transmission media

## The Link Layer
The Link Layer (also known as the Network Access Layer in TCP/IP) manages data transmission between directly connected devices on a local network. This layer provides the foundation for higher-level protocols by handling the physical addressing and local data delivery.

Ethernet is the most common protocol at this layer. It uses Media Access Control (MAC) addresses - unique identifiers assigned to network interfaces during manufacturing - to identify devices on a local network. Modern networks use switches to efficiently direct data between devices based on their MAC addresses, replacing the older hub-based broadcasting approach.

While essential for local networking, the Link Layer alone cannot handle internet-scale communications. MAC addresses lack the hierarchical structure needed for global routing, which is why we need the Internet Layer above it.

## The Internet Layer
The Internet Layer enables communication between devices on different networks through logical addressing and routing. This layer primarily uses the Internet Protocol (IP), which comes in two versions: IPv4 and IPv6.

### IP Addressing
- IPv4 uses 32-bit addresses (e.g., 192.168.0.1)
- IPv6 uses 128-bit addresses (e.g., 2001:db8:3333:4444:5555:6666:7777:8888)
- IPv6 was developed to address IPv4's limited address space (approximately 4 billion addresses)

IP addresses are logical and hierarchical, allowing for efficient routing across networks. The Internet Layer uses subnetting to create network hierarchies, similar to how postal systems organize mail delivery by country, state, city, and street.

Important protocols at this layer include:
- IP (IPv4 and IPv6) for addressing and routing
- ICMP for network diagnostics and error reporting

## The Transport Layer
The Transport Layer creates reliable connections between applications and manages data flow. It solves several critical challenges:
- Identifying which application should receive incoming data
- Handling lost or out-of-order data
- Managing network congestion
- Controlling data flow rates

### TCP vs UDP
Two primary protocols operate at this layer:

Transmission Control Protocol (TCP):
- Connection-oriented
- Guarantees data delivery and order
- Uses sliding window flow control (measured in bytes)
- Implements congestion control
- Perfect for web browsing, email, and file transfers

User Datagram Protocol (UDP):
- Connectionless
- No delivery guarantees
- Minimal overhead
- Ideal for real-time applications like video streaming and gaming

Both protocols use port numbers for multiplexing, allowing multiple applications to share network connections simultaneously.

## The Application Layer
The Application Layer hosts protocols that directly serve end-user applications. Here are three crucial protocols:

### Domain Name System (DNS)
DNS translates human-readable domain names into IP addresses through a hierarchical system:
- Root name servers
- Top-level domain servers
- Authoritative name servers
- Local DNS servers

DNS uses both recursive and iterative queries to resolve domain names, with results cached at various levels to improve performance.

### Hypertext Transfer Protocol (HTTP)
HTTP enables web communication through a request-response model:
- Text-based protocol
- Stateless design
- Supports various resource types (HTML, images, videos)
- Works across different platforms and devices

### Transport Layer Security (TLS)
TLS secures web communications through:
- Strong encryption (using algorithms like AES)
- Digital certificates for authentication
- Message integrity checks
- Secure key exchange protocols

When used with HTTP, it creates HTTPS, providing secure web browsing.

## Conclusion
The Internet Protocol Suite is a remarkably elegant system that enables global digital communication. Each layer builds upon the services provided by the layers below it, creating a robust and flexible framework that powers our connected world. Understanding these layers helps us appreciate the complexity and brilliance of the internet's architecture while providing valuable insights for network professionals and enthusiasts alike.
