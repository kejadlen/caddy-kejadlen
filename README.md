# caddy-tailscale

A [Caddy](https://caddyserver.com) image with the
[caddy-tailscale](https://github.com/tailscale/caddy-tailscale) and
[caddy-ratelimit](https://github.com/mholt/caddy-ratelimit) plugins, published
to `ghcr.io/kejadlen/caddy-tailscale`.

## Tags

- `<caddy>-<yyyy.mm.dd>`, like `2.11.4-2026.09.14`, is a specific build.
- `<caddy>`, like `2.11.4`, is the newest build for that Caddy version.
- `latest` is the newest build of the latest Caddy release.

## Release

Run the release workflow from the Actions tab, or from the terminal:

```sh
just release [caddy] [tailscale] [ratelimit]
```

Blank versions default to the latest. A plugin version can be a tag, a commit
hash, or a branch. The run summary and image labels record the plugin versions
that went into the build.
