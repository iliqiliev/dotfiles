# This fixes `mise` not being able to find CA Certificates:
# Could not initialize the HTTP client: builder error: unexpected error: No CA certificates were loaded from the system
set --export SSL_CERT_FILE $PREFIX/etc/tls/cert.pem
set --export SSL_CERT_DIR $PREFIX/etc/tls
