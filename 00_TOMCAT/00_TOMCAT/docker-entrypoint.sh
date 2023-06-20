#!/bin/bash
echo "Lancement script initialisation"
echo "Initialisation de PostGresql pour cette instance !"

set -e

export PGPASSWORD="$DB_PASSWORD"

psql -h $DB_HOST -v ON_ERROR_STOP=1 --username "$DB_USER" <<-EOSQL

	CREATE USER toolapp WITH PASSWORD 'Toolapp44!';
	CREATE DATABASE $DB_NAME;
	GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO toolapp;

EOSQL