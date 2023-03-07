

SELECT
  -- todo: cast as int
  str_split(filename, '/')[3] AS PID,
  -- todo: trim trailing \0 char
  column0
FROM read_csv_auto('/proc/[0-9]*/cmdline', header=False, filename=true, delim='\0')
ORDER BY PID ASC
