release version:
    docker manifest inspect caddy:{{version}} > /dev/null
    jj tag set v{{version}} -r @-
    git push origin tag v{{version}}
