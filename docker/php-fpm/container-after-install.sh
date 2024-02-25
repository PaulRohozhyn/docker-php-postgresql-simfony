#!/bin/bash
set -e

cd /var/www

# clear cache
php bin/console cache:clear

# run migration for app database
php bin/console doctrine:migrations:migrate --no-interaction --allow-no-migration

# run migration for app-test database
php bin/console doctrine:migrations:migrate --env=test --no-interaction --allow-no-migration

# run fixtures for app database
exec "$@"