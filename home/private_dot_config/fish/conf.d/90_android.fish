# This fixes `mise` not being able to find CA Certificates:
# Could not initialize the HTTP client: builder error: unexpected error: No CA certificates were loaded from the system
set --export SSL_CERT_FILE $PREFIX/etc/tls/cert.pem
set --export SSL_CERT_DIR $PREFIX/etc/tls

# This fixes `uv` not being able to determine LIBC:
# error: Failed to determine the libc used on the current platform
#  Caused by: Could not read ELF interpreter from any of the following paths: /bin/sh, /usr/bin/env, /bin/dash, /bin/ls
set --export UV_LIBC musl
