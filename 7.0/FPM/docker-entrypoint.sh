#!/bin/sh
set -e

USER_ID=${LOCAL_USER_ID}
echo "Starting with UID : $USER_ID"
usermod -u $USER_ID nobody
# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- php-fpm "$@"
fi

exec /usr/sbin/php-fpm7 -F "$@"