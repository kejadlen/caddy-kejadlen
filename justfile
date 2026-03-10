release version:
    docker manifest inspect caddy:{{version}} > /dev/null
    jj git push --named v{{version}}=@-
