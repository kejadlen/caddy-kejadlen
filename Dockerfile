ARG CADDY_VERSION

FROM caddy:${CADDY_VERSION}-builder AS builder

ARG CADDY_RATELIMIT_VERSION
ARG CADDY_TAILSCALE_VERSION
ARG CADDY_DNSIMPLE_VERSION
ARG TAILSCALE_VERSION

# xcaddy's default flags plus Tailscale's version stamps, since xcaddy builds
# without the VCS info Tailscale otherwise reads its version from.
ENV XCADDY_GO_BUILD_FLAGS="-trimpath -tags nobadger,nomysql,nopgx -ldflags '-w -s -X tailscale.com/version.shortStamp=${TAILSCALE_VERSION} -X tailscale.com/version.longStamp=${TAILSCALE_VERSION}'"

# An empty plugin version lets xcaddy pick the latest.
RUN xcaddy build \
    --with "github.com/mholt/caddy-ratelimit${CADDY_RATELIMIT_VERSION:+@$CADDY_RATELIMIT_VERSION}" \
    --with "github.com/tailscale/caddy-tailscale${CADDY_TAILSCALE_VERSION:+@$CADDY_TAILSCALE_VERSION}" \
    --with "github.com/caddy-dns/dnsimple${CADDY_DNSIMPLE_VERSION:+@$CADDY_DNSIMPLE_VERSION}"

FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
