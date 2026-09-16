# Empty versions default to the latest.
release caddy="" tailscale="" ratelimit="" dnsimple="":
    gh workflow run release.yml \
        -f caddy-version={{caddy}} \
        -f caddy-tailscale-version={{tailscale}} \
        -f caddy-ratelimit-version={{ratelimit}} \
        -f caddy-dnsimple-version={{dnsimple}}
