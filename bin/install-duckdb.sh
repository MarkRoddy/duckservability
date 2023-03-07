#!/bin/bash

set -e;


# Tease out 'duckdb==0.7.1' from the requirement.txt to determine the version of
# the duckdb commandline we want to download and install.
DUCKDB_VERSION=$(cat requirements.txt |grep ^duckdb\=|cut -d '=' -f 3)

curl -LO "https://github.com/duckdb/duckdb/releases/download/v${DUCKDB_VERSION}/duckdb_cli-linux-amd64.zip"
unzip duckdb_cli-linux-amd64.zip
mkdir -p ~/.local/bin/ && mv duckdb ~/.local/bin/ && rm duckdb_cli-linux-amd64.zip
duckdb --version
