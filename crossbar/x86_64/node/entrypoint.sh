#!/usr/bin/env sh
set -e

# Check if we are running crossbar start as root and change the user, NOTE this does allow the container to be started with `--user`
if [ "$1 $2" = 'crossbar start' -a "$(id -u)" = '0' ]; then
	chown -R crossbar .
	exec su-exec crossbar "$@"
fi

exec "$@"