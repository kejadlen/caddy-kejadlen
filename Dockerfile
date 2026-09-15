ARG CADDY_VERSION

FROM caddy:${CADDY_VERSION}-builder AS builder

ARG CADDY_RATELIMIT_VERSION
ARG CADDY_TAILSCALE_VERSION

# An empty plugin version lets xcaddy pick the latest.
RUN xcaddy build \
    --with "github.com/mholt/caddy-ratelimit${CADDY_RATELIMIT_VERSION:+@$CADDY_RATELIMIT_VERSION}" \
    --with "github.com/tailscale/caddy-tailscale${CADDY_TAILSCALE_VERSION:+@$CADDY_TAILSCALE_VERSION}"

FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
