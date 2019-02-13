# Caddy

This is a build of https://github.com/mholt/caddy, available at
https://hub.docker.com/r/brownjohnf/caddy/

## Usage

1. Create a Dockerfile inheriting from this image (published at
   brownjohnf/caddy)
2. COPY a Caddyfile into /var/lib/caddy/Caddyfile in the new image
3. Expose whatever ports you require in addition to the defaults
4. Build and run your new image!

Or, you can just run brownjohnf/caddy and bind-mount in a Caddyfile.

