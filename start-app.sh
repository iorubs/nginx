#!/bin/bash
set -e

service nginx start && tail -f /var/log/nginx/access.log

exec "$@"