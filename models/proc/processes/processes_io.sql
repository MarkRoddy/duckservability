

SELECT
  str_split(filename, '/')[3] AS PID,
  -- Pivot each of our name/value pairs to columns
  first(value) FILTER (WHERE tag = 'rchar') AS 'rchar',
  first(value) FILTER (WHERE tag = 'wchar') AS 'wchar',
  first(value) FILTER (WHERE tag = 'syscr') AS 'syscr',
  first(value) FILTER (WHERE tag = 'syscw') AS 'syscw',
  first(value) FILTER (WHERE tag = 'read_bytes') AS 'read_bytes',
  first(value) FILTER (WHERE tag = 'write_bytes') AS 'write_bytes',
  first(value) FILTER (WHERE tag = 'cancelled_write_bytes') AS 'cancelled_write_bytes',
FROM read_csv('/proc/[0-9]*/io', header=False, filename=true, delim=':',
     columns={tag: 'VARCHAR', value: 'int64'})
GROUP BY PID
ORDER BY PID ASC
