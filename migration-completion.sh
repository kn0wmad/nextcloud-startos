#!/bin/bash
set -e

/var/www/html/occ db:add-missing-indices
/var/www/html/occ maintenance:repair --include-expensive

mkdir -p /root/migrations
touch /root/migrations/$NEXTCLOUD_VERSION.complete
touch /root/migrations/$(echo "$NEXTCLOUD_VERSION" | sed 's/\..*//g').complete
