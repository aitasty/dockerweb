node () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --volume $PWD:/var/www/html:rw \
        --workdir /var/www/html \
        node:10.16.0-alpine node "$@"
}
npm () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --volume $PWD:/var/www/html:rw \
        --workdir /var/www/html \
        node:10.16.0-alpine npm "$@"
}

php () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --volume $(pwd):/var/www/html:rw \
        --workdir /var/www/html \
        web_php71 php "$@"
}
composer () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --user $(id -u):$(id -g) \
        --volume $(pwd)/composer:/tmp \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume $(pwd):/app \
        composer "$@"
}
