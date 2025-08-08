#!/bin/bash

if [ -f /tmp/mysql_root_password.txt ]; then
    PASSWORD=$(cat /tmp/mysql_root_password.txt)
    echo "Accessed Root password"
else
    echo "Password file not found"
    exit 1
fi
echo "Setting MYSQL_ROOT_PASSWORD  available in env"
export MYSQL_ROOT_PASSWORD=$PASSWORD
echo "Now MYSQL_ROOT_PASSWORD  available in env"
echo "MYSQL_ROOT_PASSWORD is: '$MYSQL_ROOT_PASSWORD'"
env | grep MYSQL_ROOT_PASSWORD
rm -rf /tmp/mysql_root_password.txt
exec /entrypoint.sh mysqld