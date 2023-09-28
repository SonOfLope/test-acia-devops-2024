#!/bin/bash
set -e

PG_HBA="/var/lib/postgresql/data/pg_hba.conf"

echo "local   all             all                                     trust" > $PG_HBA
echo "host    all             all             0.0.0.0/0               trust" >> $PG_HBA