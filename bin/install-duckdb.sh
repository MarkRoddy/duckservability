#!/bin/bash

set -e;


DUCKDB_VERSION=0.7.1
curl -LO "https://github.com/duckdb/duckdb/releases/download/v${DUCKDB_VERSION}/duckdb_cli-linux-amd64.zip"
unzip duckdb_cli-linux-amd64.zip
mkdir -p ~/.local/bin/ && mv duckdb ~/.local/bin/ && rm duckdb_cli-linux-amd64.zip
duckdb --version
