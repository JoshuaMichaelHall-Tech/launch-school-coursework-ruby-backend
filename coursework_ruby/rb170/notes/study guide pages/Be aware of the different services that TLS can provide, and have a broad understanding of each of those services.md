Transport Layer Security (TLS) provides three main services: encryption, authentication, and integrity.

1. Encryption:
	1. TLS uses a combination of asymmetric (public key) and symmetric key encryption.
	2. The TLS handshake process uses asymmetric encryption to securely exchange symmetric keys.
	3. Subsequent communications use faster symmetric encryption for data transfer.
	4. This ensures that messages can only be read by the intended recipient.
2. Authentication:
	1. TLS uses digital certificates to verify the identity of participants, typically the server.
	2. Certificates are issues by trusted Certificate Authorities (CAs).
	3. This prevents man-in-the-middle attacks by ensuring you're communicating with the intended party.
3. Integrity:
	1. TLS uses Message Authentication Codes (MACs) to ensure data integrity.
	2. A MAC is created for each message using a shared secret key and a hash function.
	3. The recipient can verify that the message hasn't been tampered with during transit.

These three services work together to provide a secure communication channel over an inherently insecure network.