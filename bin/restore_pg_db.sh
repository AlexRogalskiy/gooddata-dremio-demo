#! /bin/bash

export BIN_DIR="`dirname \"$0\"`"
export DATA_DIR=${BIN_DIR}/../data

echo $DATA_DIR

pg_restore --host=localhost --port=5432  --dbname=demo ${DATA_DIR}/backup/insurance.dump