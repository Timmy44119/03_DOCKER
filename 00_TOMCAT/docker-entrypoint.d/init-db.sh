#!/usr/bin/env bash

echo "Initialisation de PostGresql pour cette instance !"

set -e

docker run psql psql -hp psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL

	CREATE USER toolapp WITH PASSWORD 'Toolapp44!';
	CREATE DATABASE $POSTGRES_DB;
	GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO toolapp;

EOSQL