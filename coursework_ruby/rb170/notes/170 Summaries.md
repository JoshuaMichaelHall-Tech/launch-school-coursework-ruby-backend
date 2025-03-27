### The Internet

- The internet is a vast _network of networks_. It is comprised of both the _network infrastructure_ itself (devices, routers, switches, cables, etc) and the _protocols_ that enable that infrastructure to function.
- Protocols are _systems of rules_. Network protocols are systems of rules governing the exchange or transmission of data over a network.
- Different types of protocol are concerned with different aspects of network communication. It can be useful to think of these different protocols as operating at particular 'layers' of the network.
- _Encapsulation_ is a means by which protocols at different network layers can work together.
- Encapsulation is implemented through the use of _Protocol Data Units_ (PDUs). The PDU of a protocol at one layer, becomes the data payload of the PDU of a protocol at a lower layer.
- The _physical network_ is the tangible infrastructure that transmits the electrical signals, light, and radio waves which carry network communications.
- _Latency is a measure of delay_. It indicates the amount of time it takes for data to travel from one point to another.
- _Bandwidth is a measure of capacity_. It indicates the amount of data that can be transmitted in a set period of time.
- _Ethernet_ is a set of standards and protocols that enables _communication between devices on a local network_.
- Ethernet uses a Protocol Data Unit called a Frame.
- Ethernet uses _MAC addressing_ to identify devices connected to the local network.
- The _Internet Protocol_ (IP) is the predominant protocol used for _inter-network communication_.
- There are two versions of IP currently in use: IPv4 and IPv6.
- The _Internet Protocol_ uses a system of addressing (IP Addressing) to _direct data between one device and another across networks_.
- IP uses a Protocol Data Unit called a Packet.

### Transport Layer

- _Multiplexing_ and _demultiplexing_ provide for the transmission of _multiple signals over a single channel_
- Multiplexing is enabled through the use of _network ports_
- Network sockets can be thought of as a _combination of IP address and port number_
- At the _implementation level_, network sockets can also be _socket objects_
- The underlying network is _inherently unreliable_. If we want reliable data transport we need to implement a system of rules to enable it.
- _TCP_ is a _connection-oriented_ protocol. It establishes a connection using the _Three-way-handshake_
- TCP provides reliability through _message acknowledgement_ and _retransmission_, and _in-order delivery_.
- TCP also provides _Flow Control_ and _Congestion Avoidance_
- The main _downsides of TCP_ are the _latency overhead of establishing a connection_, and the potential _Head-of-line blocking_ as a result of in-order delivery.
- _UDP_ is a very simple protocol compared to TCP. It provides _multiplexing_, but no reliability, no in-order delivery, and no congestion or flow control.
- _UDP_ is _connectionless_, and so doesn't need to establish a connection before it starts sending data
- Although it is unreliable, the _advantage of UDP_ is _speed_ and _flexibility_.


### Intro to HTTP

- The _Domain Name System_ (DNS) is a distributed database which _maps a domain name_ such as `google.com` _to an IP Address_ such as `216.58.213.14`.
- A _URI_ is an _identifier_ for a _particular_ resource within an information space.
- A URL is a subset of URI, but the two terms are often used interchangeably.
- URL components include the _scheme_, _host_ (or hostname), _port_, _path_, and _query string_.
- _Query strings_ are used to _pass additional data_ to the server during an HTTP Request. They take the form of _name/value pairs_ separated by an '=' sign. Multiple name/value pairs are separated by an `&` sign. The start of the query string is indicated by a `?`.
- _URL encoding_ is a technique whereby _certain characters_ in a URL are _replaced with an ASCII code_.
- URL encoding is used if a character has no corresponding character in the ASCII set, is unsafe because it is used for encoding other characters, or is reserved for special use within the url.
- A single HTTP message exchange consists of a _Request_ and a _Response_. The exchange generally takes place between a _Client_ and a _Server_. The client sends a Request to the server and the server sends back a Response.
- An _HTTP Request_ consists of a _request line_, _headers_, and an optional _body_.
- An _HTTP Response_ consists of a _status line_, optional _headers_, and an optional _body_.
- _Status codes_ are part of the status line in a Response. They indicate the status of the request. There are various categories of status code.
- HTTP is a _stateless_ protocol. This means that each Request/ Response cycle is independent of Request and Responses that came before or those that come after.
- _Statefulness can be simulated_ through techniques which use _session IDs_, _cookies_, and _AJAX_.
- HTTP is _inherently unsecure_. Security can be increased by using _HTTPS_, enforcing _Same-origin policy_, and using techniques to prevent _Session Hijacking_ and _Cross-site Scripting_.

### Working with HTTP
- HTTP is a _text-based_ protocol. HTTP Request and Responses involve sending text between the client and server
- In order for the protocol to work, the Request and Response must be structured in such a way that both the client and the server can understand them.
- With HTTP/1.1, the end of the headers is indicated by an _empty line_.
- The `Content-Length` header can be used to indicate the _size of the body_. This can help determine where the HTTP message should end.

### Transport Layer Security
- _HTTP Requests and Responses_ are transferred in _plain text_; as such they are _essentially insecure_.
- We can use the _Transport Layer Security_ (TLS) Protocol to add security to HTTP communications.
- _TLS encryption_ allows us to _encode messages_ so that they can only be read by those with an authorized means of decoding the message
- TLS encryption uses a combination of _Symmetric Key Encryption_ and _Asymmetric Key Encryption_. Encryption of the initial key exchange is performed asymmetrically, and subsequent communications are symmetrically encrypted.
- The _TLS Handshake_ is the process by which a client and a server _exchange encryption keys_.
- The _TLS Handshake_ must be performed before secure data exchange can begin; it involves _several round-trips of latency_ and therefore has an _impact on performance_.
- A _cipher suite_ is the _agreed set of algorithms_ used by the client and server during the secure message exchange.
- _TLS authentication_ is a means of _verifying the identity_ of a participant in a message exchange.
- TLS Authentication is implemented through the use of _Digital Certificates_.
- Certificates are _signed_ by a _Certificate Authority_, and work on the basis of a _Chain of Trust_ which leads to one of a small group of highly trusted _Root CAs_.
- The server's certificate is _sent_ during the _TLS Handshake_ process.
- _TLS Integrity_ provides a means of _checking_ whether a message has been _altered or interfered with_ in transit.
- TLS Integrity is implemented through the use of a _Message Authentication Code_ (MAC).


### Evolution of Networking
- HTTP has changed considerably over the years, and is continuing to change.
- Many of the changes to HTTP are focused on improving performance in response to the ever increasing demands of modern networked applications.
- Latency has a big impact on the performance of networked applications. As developers and software engineers we need to be aware of this impact, and try to mitigate against it through the use of various optimizations.
- In building networked applications, there are tools and techniques available to us that work around or go beyond the limitations of basic HTTP request-response functionality.
- For certain use cases a peer-to-peer architecture may be more appropriate than a client-server architecture.


