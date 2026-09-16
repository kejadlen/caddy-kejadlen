# Empty versions default to the latest.
release caddy="" tailscale="" ratelimit="" dnsimple="":
    gh workflow run release.yml \
        --repo kejadlen/caddy-kejadlen \
        --raw-field caddy-version={{caddy}} \
        --raw-field caddy-tailscale-version={{tailscale}} \
        --raw-field caddy-ratelimit-version={{ratelimit}} \
        --raw-field caddy-dnsimple-version={{dnsimple}}
