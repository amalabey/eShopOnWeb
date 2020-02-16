#!/bin/bash

/opt/mssql/bin/sqlservr & ./create-schema.sh

eval $1