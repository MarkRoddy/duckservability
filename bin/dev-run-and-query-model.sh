#!/bin/bash

set -e

if [ ! $# = 1 ]; then
    echo "usage: $0 model-name";
    exit 1;
fi
MODEL_NAME="$1"
dbt run -m "$MODEL_NAME"
duckdb build/duckservability.duckdb "select * from $MODEL_NAME"
