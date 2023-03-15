
# Duckservability: Query Your Linux Systems
Duckservability is a DuckDB database schema for querying standard Linux systems via the `/proc` virtual file system which exposes real time kernel and process statistics. Traditionally files exposing these statistics have been aggregated via unix commandline tools. This project wraps these files in database tables that can be queried, joined, etc via SQL.

# Example Queries

Below are a few examples of questions you can ask with Ducservability. Additionally, see the [example-queries](tree/main/example-queries) directory for more examples.

## Processes with Most IO
Query processes that have performed the most IO operation in megabytes.
![most io](images/process-most-io.png)



