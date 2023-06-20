#!/bin/bash
echo "Lancement script initialisation"
echo "Initialisation de PostGresql pour cette instance !"

set -e

psql -h $DB_HOST:$DB_PORT -v ON_ERROR_STOP=1 --username "$DB_USER" --dbname "$DB_NAME" <<-EOSQL

	CREATE USER toolapp WITH PASSWORD 'Toolapp44!';
	CREATE DATABASE $POSTGRES_DB;
	GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO toolapp;

EOSQL